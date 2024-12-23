class UsersController < ApplicationController
    before_action :require_signin, except: [:new, :create]
    before_action :require_correct_user, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:destroy]

    def index
        @users = User.all.where(admin: false).order("name")
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user, notice: "Thanks for signing up!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
    end


    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user), notice: "User updated successfully!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_url, status: :see_other, notice: "User deleted successfully"
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :organization, :password, :password_confirmation)
    end

    def require_correct_user
        @user = User.find(params[:id])
        redirect_to root_url, status: :see_other, alert: "You are not authorized to perform that action!" unless current_user?(@user)
    end

end
