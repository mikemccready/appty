Rails.application.config.middleware.use OmniAuth::Builder do
	
	 provider :developer unless Rails.env.production?

	#provider :facebook, ENV["facebook_client_id"], ENV["facebook_secret"], scope: "user:email"
	provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"],{
		access_type: 'offline',
		# :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}},

	    scope: 'https://www.googleapis.com/auth/plus.login, https://www.googleapis.com/auth/userinfo.email, https://www.googleapis.com/auth/calendar',
	    redirect_uri: 'https://apptytyme.herokuapp.com/auth/google_oauth2/callback'
	    #redirect_uri: 'http://localhost:3000/auth/google_oauth2/callback'
	}

end



