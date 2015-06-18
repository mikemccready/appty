class SessionsController < ApplicationController

def create
  user = User.find_by(email: params[:login][:email])

  if user && user.authenticate(params[:login][:password])
    session[:user_id] = user.id.to_s 
    redirect_to users_path
  else
    render :new 
  end
end

# def show
#     @auth = request.env['omniauth.auth']
#     session['auth'] = @auth
#     @token = @auth["credentials"]["token"]
#     client = Google::APIClient.new
#     client.authorization.access_token = @token
#     service = client.discovered_api('calendar', 'v3')
#     @result = client.execute(
#       :api_method => service.events.list,
#       :parameters => {'calendarId' => 'primary' },
#       :headers => {'Content-Type' => 'application/json'})
#      #redirect_to root_path
# end


def destroy
      session.delete(:user_id)
    	session['auth'] = nil
   		redirect_to root_path
	end
end

