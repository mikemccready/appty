class UsersController < ApplicationController

  def index
      if params[:search]
       @users = User.search(params[:search])
       else
    @users = User.where(:is_provider => true)
    respond_to do |format|
        format.html {
            render
        }
        format.json {
            render json: @users, only: [:user_name, :category]
        } 
      end
  end
end

  def show
    @user = User.find(params[:id])
    @appointments = Appointment.all
    respond_to do |format|
          format.html {
              render
          }
          format.json {
              render json: @user, only: [:user_name]
          }
      end
  end

  def appointments
    @user = User.find(params[:id])
    # @appointments = @user.appointments
  end

  def providers
    @user = User.find(params[:id])
    # @appointments = @user.appointments
  end  


  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    @user.update_attributes(user_params)

    # respond_to do |format|
      if @user.save
        redirect_to user_path(@user)
        # format.html { redirect_to @user, notice: 'User was successfully updated.' }
        # format.json { render :show, status: :ok, location: @user }
      else
        # format.html { render :edit }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end

  end


  def destroy
    @user.destroy
    # respond_to do |format|
    #   format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end


  def provider
      @user = User.find(params[:id])
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(user_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :email, :phone_number, :image, :password, :provider, :is_provider, :category, :sign_ins)
    end
end