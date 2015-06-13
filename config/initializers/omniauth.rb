Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV["714462645332835"], ENV["1418b31036662770848b84bc2005e7d9"], 
	{:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end