class SessionsController < ApplicationController

	def show
    	redirect_to root_path unless session[:user_id]
    	@auth = current_user
	end


	def create
		@user = User.from_omniauth(request.env["omniauth.auth"])
		# @appointment = Appointment.from_omniauth(request.env["omniauth.auth"])
     
		@auth = request.env['omniauth.auth']
   		session['user_id'] = @auth["id"]
      current_user
   		@token = @auth["credentials"]["token"]
   		client = Google::APIClient.new
   		client.authorization.access_token = @token
   		service = client.discovered_api('calendar', 'v3')
   		@result = client.execute(
   		  :api_method => service.events.list,
   		  :parameters => {'calendarId' => 'primary' },
   		  :headers => {'Content-Type' => 'application/json'})
 	
   		@result.data["items"].each do |i|
    	 	if ((i["summary"] == "appty"))
    	   	Appointment.create(
            location: i["location"],
            start_time: i["start"]["dateTime"],
            end_time: i["end"]["dateTime"],
            availability: true,
            provider_id: @user.id,
            summary: i["summary"],
            event_id: i["id"],
            event_creator: i["creator"]["displayName"],
)
    	 	else
        end	
      end

		 session[:user_id] = @user.id

     
     @user["sign_ins"] ||= 0
     @user["sign_ins"] += 1
     @user["is_provider"] = false
     @user.save



     if (@user["sign_ins"] == 1)
        @user["category"] = ""
       redirect_to edit_user_path(@user)
     else 
       redirect_to user_path(@user)
     end

  end

	def destroy
      session.delete(:user_id)
    	session['auth'] = nil
      flash[:notice] = "You have successfully logged out."
   		redirect_to root_path
	end
end





