class BookingsController < ApplicationController
    before_action :require_signin
    before_action :require_correct_user, only: [:edit, :update, :destroy]

    def index
        @room = Room.find(params[:room_id])
        @bookings = @room.bookings.where("start_time > ?", Time.now).order("start_time")
    end

    def list
        @bookings = Booking.all.where("start_time > ?", Time.now).order("start_time").order("room_id")
    end

    def new
        @room = Room.find(params[:room_id])
        @booking = @room.bookings.new
        upcoming_start_time = Time.current.beginning_of_hour + 1.hour # Sets minutes to 0 and adds one hour to start time
        @booking.start_time = upcoming_start_time
        @booking.end_time = upcoming_start_time + 1.hour
        @booking.title = "Untitled meeting"
    end

    def create
        @room = Room.find(params[:room_id])
        @booking = @room.bookings.new(booking_params)
        @booking.user = current_user
        if @booking.save
            redirect_to @room, notice: "Booking created w success!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @room = Room.find(params[:room_id])
        @booking = @room.bookings.find(params[:id])
    end

    def update
        @room = Room.find(params[:room_id])
        @booking = @room.bookings.find(params[:id])
        if @booking.update(booking_params)
            redirect_to @room, notice: "Booking updated w success!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @room = Room.find(params[:room_id])
        @booking = @room.bookings.find(params[:id])
        @booking.destroy
        redirect_to room_path, status: :see_other, notice: "Booking deleted w success!"
    end

private

    def booking_params
        params.require(:booking).
            permit(:title, :description, :start_time, :end_time)
    end

    def require_correct_user
        room = Room.find(params[:room_id])
        booking = room.bookings.find(params[:id])
        user = User.find(booking.user_id)
        redirect_to root_url, status: :see_other, alert: "You are not authorized to perform that action!" unless current_user?(user)
    end
end
