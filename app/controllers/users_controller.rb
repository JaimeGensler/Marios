class UsersController < ApplicationController
    def new
        @info = {title: 'Register', css: 'form.css'}
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "You've successfully signed up!"
            session[:user_id] = @user.id
            redirect_to "/"
        else
            flash[:alert] = "There was a problem signing up."
            redirect_to '/signup'
        end
    end

    def self.my_test_method
        'Jaime rocks'
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
