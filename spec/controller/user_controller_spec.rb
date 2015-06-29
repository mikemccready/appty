require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before :each do
    @user1 = User.create(user_name:"Mike", email: "mike@gmail.com")
    @user2 = User.create(user_name:"Mike", email: "mike@gmail.com")
  end

  describe "GET index" do
    before :each do
      get :index
  end

    it "should get index" do
      get 'index'
      response.should be_success
    end

    it "response should be a success" do
      expect(response).to have_http_status(200)
    end
  end  


  describe "GET show" do
    before :each do
      get :show, id: @user1.id
  end

    it "should render the show page" do
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  describe "POST create" do
    describe "with valid params" do
      
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}
        }.to change(User, :count).by(1)
      end
    end
  end

end


