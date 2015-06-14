require 'test_helper'

class ProvidershipsControllerTest < ActionController::TestCase
  setup do
    @providership = providerships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:providerships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create providership" do
    assert_difference('Providership.count') do
      post :create, providership: { provider_id: @providership.provider_id, user_id: @providership.user_id }
    end

    assert_redirected_to providership_path(assigns(:providership))
  end

  test "should show providership" do
    get :show, id: @providership
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @providership
    assert_response :success
  end

  test "should update providership" do
    patch :update, id: @providership, providership: { provider_id: @providership.provider_id, user_id: @providership.user_id }
    assert_redirected_to providership_path(assigns(:providership))
  end

  test "should destroy providership" do
    assert_difference('Providership.count', -1) do
      delete :destroy, id: @providership
    end

    assert_redirected_to providerships_path
  end
end
