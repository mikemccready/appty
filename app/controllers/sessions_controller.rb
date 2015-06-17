class SessionsController < ApplicationController
  	def new
  	end

	def show
    	redirect_to root_path unless session['auth']
    	@auth = session['auth']
	end

	def create
    # user = User.find_by(email: params[:login][:email])

    # if user && user.authenticate(params[:login][:password])
    #     session[:user_id] = user.id.to_s 
    #     redirect_to users_path
    # else
    #     render :new 
    # end

   

    @auth = request.env['omniauth.auth']
    session['auth'] = @auth
    # @token = @auth["credentials"]["token"]
    # @refresh_token = @auth["credentials"]["refresh_token"]
    # @expires_at = @auth["credentials"]["expires_at"]
   
    #  Auth.create(:provider => google_oauth2, :token => @token,
    # :refresh_token => @refresh_token, :expires_at => @expires_at)
    @token = @auth["credentials"]["token"]
    client = Google::APIClient.new
    client.authorization.access_token = @token
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      :api_method => service.calendar_list.list,
      :parameters => {},

      :headers => {'Content-Type' => 'application/json'})
    



    # redirect_to sessions_show_path


    
	end

	def destroy
      # session.delete(:user_id)
    	session['auth'] = nil
   		redirect_to root_path
	end

#   def init_client
#   client = Google::APIClient.new
#   # Fill client with all needed data
#   client.authorization.access_token = @token #token is taken from auth table
#   client.authorization.client_id = @oauth2_key
#   client.authorization.client_secret = @oauth2_secret
#   client.authorization.refresh_token = @refresh_token
#   return client
# end

# def get_all_calendars
#   client = init_client

#   service = client.discovered_api('calendar', 'v3')
#   @result = client.execute(
#     :api_method => service.calendar_list.list,
#     :parameters => {},
#     :headers => {'Content-Type' => 'application/json'})
# end





end
