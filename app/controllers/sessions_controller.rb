class SessionsController < ApplicationController

    def new
        @info = {title: 'Register', css: 'form.css'}
        render :new
    end
    def create
        @user = User.authenticate(params[:ident], params[:password])
        if @user
            flash[:notice] = "Welcome back, #{@user.username}!"
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash[:alert] = 'There was a problem signing in. Please try again.'
            redirect_to signin_path
        end
    end

    def destroy
        flash[:notice] = "Come back soon, #{@user.username}!"
        session[:user_id] = nil
        redirect_to '/'
    end
end
