class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        @user.save
        log_in @user
        redirect_to root_url
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password_digest, :password, :age)
    end
end
