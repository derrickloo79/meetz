class BookingsController < ApplicationController

    def index
        @room = Room.find(params[:room_id])
        @bookings = @room.bookings.order("start_time")
        @upcoming_start_time = Time.current.change(min: 0) + 1.hour # Sets minutes to 0 and adds one hour
        @upcoming_end_time = @upcoming_start_time =  + 1.hour
    end

    def new
        @room = Room.find(params[:room_id])
        @booking = @room.bookings.new
    end

    def create
        @room = Room.find(params[:room_id])
        @booking = @room.bookings.new(booking_params)
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
            permit(:title, :description, :booked_by, :start_time, :end_time)
    end
end
