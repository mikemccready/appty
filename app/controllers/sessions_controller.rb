class SessionsController < ApplicationController

def show
    redirect_to root_path unless session[:user_id]
    @auth = current_user
end


def create
	@user = User.from_omniauth(request.env["omniauth.auth"])
	session[:user_id] = @user.id
	redirect_to sessions_show_path

end


def destroy
      # session.delete(:user_id)
    	session['auth'] = nil
   		redirect_to root_path
	end
end

