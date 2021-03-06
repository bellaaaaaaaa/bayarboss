class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to root_url
        else
            redirect_to root_url
        end
    end
    
    def edit
    end

    def show
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to @user
    end

    def new_item
        respond_to do |format|
            format.html {}
            format.js
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password_digest, :password, :age, :image)
    end
end
