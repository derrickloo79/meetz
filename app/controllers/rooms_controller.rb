class RoomsController < ApplicationController
    before_action :require_signin
    before_action :require_admin, except: [:index, :show]

    def index
        @rooms = Room.all
    end

    def new
        @room = Room.new
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            redirect_to @room, notice: "Room created successfully"
        else
            render :new, status: :unprocessable_entity  
        end
    end

    def show
        @room = Room.find(params[:id])
        @bookings = @room.bookings
    end

    def edit
        @room = Room.find(params[:id])
    end

    def update
        @room = Room.find(params[:id])
        if @room.update(room_params)
            redirect_to @room, notice: "Room updated successfully"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        redirect_to rooms_path, status: :see_other, notice: "Room deleted successfully"
    end

private

    def room_params
       params.require(:room).permit(:name,:room_type)
    end
end
