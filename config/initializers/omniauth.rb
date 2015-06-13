Rails.application.config.middleware.use OmniAuth::Builder do
	provider :developer unless Rails.env.production?
	provider :facebook, ENV["facebook_client_id"], ENV["facebook_secret"] 
	# {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
