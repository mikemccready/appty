class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |format|
        format.html {
            render
        }
        format.json {
            render json: @users
        }
      end
  end

  def show
    @user = User.find(params[:id])
    @appointments = @user.appointments
    respond_to do |format|
          format.html {
              render
          }
          format.json {
              render json: @user, only: [:user_name]
          }
      end
  end


  def new
    @user = User.new
  end

  def edit
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      # flash[:success] = "You have succesfully sign up"
      # format.json { render :show, status: :created, location: @user}
      redirect_to root_path 
    else
      render :new
      # format.json { render json: @user.errors, status: :unprocessable_entity }

    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        # format.html { redirect_to @user, notice: 'User was successfully updated.' }
        # format.json { render :show, status: :ok, location: @user }
      else
        # format.html { render :edit }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user.destroy
    # respond_to do |format|
    #   format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(user_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :email, :phone_number, :image, :password, :provider)
    end
end