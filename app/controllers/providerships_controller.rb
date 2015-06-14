class ProvidershipsController < ApplicationController
  # before_action :set_providership, only: [:show, :edit, :update, :destroy]

  # GET /providerships
  # GET /providerships.json
  # def index
  #   @providerships = Providership.all
  # end

  # GET /providerships/1
  # GET /providerships/1.json
  # def show
  # end

  # # GET /providerships/new
  # def new
  #   @providership = Providership.new
  # end

  # # GET /providerships/1/edit
  # def edit
  # end

  # POST /providerships
  # POST /providerships.json
  def create
    @providership = current_user.providerships.build(:provider_id => params[:provider_id])

      if @providership.save
        # format.html {  notice: 'Providership was successfully created.' }
        # format.json { render :show, status: :created, location: @providership }
        redirect_to root_path
      else
        # format.html { render :new }
        # format.json { render json: @providership.errors, status: :unprocessable_entity }
        redirect_to root_path
      end
  end

  # PATCH/PUT /providerships/1
  # PATCH/PUT /providerships/1.json
  # def update
  #   respond_to do |format|
  #     if @providership.update(providership_params)
  #       format.html { redirect_to @providership, notice: 'Providership was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @providership }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @providership.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /providerships/1
  # DELETE /providerships/1.json
  def destroy
    @providership = current_user.providerships.find(params[:id])
    @providership.destroy
    # respond_to do |format|
    #   format.html { redirect_to providerships_url, notice: 'Providership was successfully destroyed.' }
    #   format.json { head :no_content }
        redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_providership
      @providership = Providership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def providership_params
      params.require(:providership).permit(:user_id, :provider_id)
    end
end
