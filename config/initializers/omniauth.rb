Rails.application.config.middleware.use OmniAuth::Builder do
	provider :developer unless Rails.env.production?
	provider :facebook, ENV["facebook_client_id"], ENV["facebook_secret"] 
	provider :google, ENV['GOOGLE_API_CLIENT_ID'], ENV['GOOGLE_API_CLIENT_SECRET']
	# {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
