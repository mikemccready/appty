class SessionsController < ApplicationController

def create
 @auth = request.env['omniauth.auth']
 session['auth']
end


def destroy
      session.delete(:user_id)
    	session['auth'] = nil
   		redirect_to root_path
	end
end

