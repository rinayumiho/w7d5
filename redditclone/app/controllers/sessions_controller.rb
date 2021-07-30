class SessionsController < ApplicationController
    before_action :ensure_logged_in, only: %i(destroy)
    def new 
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:name],
            params[:user][:password]
        )
        if @user.nil?
            flash.now[:errors] = ["Invalid name or password"]
            render :new
        else
            login!(@user)
            redirect_to users_url
        end
    end

    def destroy
        log_out!
        redirect_to new_session_url
    end
end