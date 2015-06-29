require 'omniauth-google-oauth2'

config.omniauth :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], { access_type: "offline", approval_prompt: "" }