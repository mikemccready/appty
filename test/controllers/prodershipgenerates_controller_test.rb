require 'test_helper'

class ProdershipgeneratesControllerTest < ActionController::TestCase
  setup do
    @prodershipgenerate = prodershipgenerates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prodershipgenerates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prodershipgenerate" do
    assert_difference('Prodershipgenerate.count') do
      post :create, prodershipgenerate: { create: @prodershipgenerate.create, destroy: @prodershipgenerate.destroy, friend_id: @prodershipgenerate.friend_id, friendship: @prodershipgenerate.friendship, nifty_scaffold: @prodershipgenerate.nifty_scaffold, user_id: @prodershipgenerate.user_id }
    end

    assert_redirected_to prodershipgenerate_path(assigns(:prodershipgenerate))
  end

  test "should show prodershipgenerate" do
    get :show, id: @prodershipgenerate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prodershipgenerate
    assert_response :success
  end

  test "should update prodershipgenerate" do
    patch :update, id: @prodershipgenerate, prodershipgenerate: { create: @prodershipgenerate.create, destroy: @prodershipgenerate.destroy, friend_id: @prodershipgenerate.friend_id, friendship: @prodershipgenerate.friendship, nifty_scaffold: @prodershipgenerate.nifty_scaffold, user_id: @prodershipgenerate.user_id }
    assert_redirected_to prodershipgenerate_path(assigns(:prodershipgenerate))
  end

  test "should destroy prodershipgenerate" do
    assert_difference('Prodershipgenerate.count', -1) do
      delete :destroy, id: @prodershipgenerate
    end

    assert_redirected_to prodershipgenerates_path
  end
end
