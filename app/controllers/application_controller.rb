class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  def redirect
    google_api_client = Google::APIClient.new({
      application_name: 'Appty',
      application_version: '1.0.0'
    })

    google_api_client.authorization = Signet::OAuth2::Client.new({
      client_id: ENV.fetch('GOOGLE_API_CLIENT_ID'),
      client_secret: ENV.fetch('GOOGLE_API_CLIENT_SECRET'),
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      scope: 'https://www.googleapis.com/auth/calendar.readonly',
      redirect_uri: url_for(:action => :callback)
    })

    authorization_uri = google_api_client.authorization.authorization_uri

    redirect_to authorization_uri.to_s
  end


  # def authorize

  #   @auth = request.env['omniauth.auth']
  #   session['auth'] = @auth
  #   # @token = @auth["credentials"]["token"]
  #   # @refresh_token = @auth["credentials"]["refresh_token"]
  #   # @expires_at = @auth["credentials"]["expires_at"]
   
  #   #  Auth.create(:provider => google_oauth2, :token => @token,
  #   # :refresh_token => @refresh_token, :expires_at => @expires_at)
  #   @token = @auth["credentials"]["token"]
  #   client = Google::APIClient.new
  #   client.authorization.access_token = @token
  #   service = client.discovered_api('calendar', 'v3')
  #   @result = client.execute(
  #     :api_method => service.events.list,
  #     :parameters => { 'calendarId' => 'primary' },
  #     :headers => {'Content-Type' => 'application/json'}
  #     )
    

  #   redirect_to root_path
  # end

end
