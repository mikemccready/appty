Rails.application.config.middleware.use OmniAuth::Builder do
	provider :developer unless Rails.env.production?
	provider :facebook, ENV["facebook_client_id"], ENV["facebook_secret"], scope: "user:email"
	provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
