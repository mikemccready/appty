# module API
#   class ApiusersController < ApplicationController
#     def index
#     	render json: Apiuser.all
#     end

#     def show
# 		render json: Apiuser.find(params[:id])
# 	end

# 	def create
# 		apiuser = Apiuser.new(apiuser_params)
# 			if apiuser.save 
# 				render json: apiuser, status: 201, location: [:api, apiuser]
# 			else
# 				render json: apiuser.errors, status: 422
# 			end
# 	end

# 	def destroy
# 		apiuser = Apiuser.find(params[:id])
# 		apiuser.destroy
# 		head 204
# 	end


#  private
#     def apiuser_params
#       params.require(:apiuser).permit(:user_name, :email, :phone_number, :image_url, :url, :uid, :provider, :is_provider)
#     end
#   end
# end