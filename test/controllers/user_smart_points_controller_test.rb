require 'test_helper'

class UserSmartPointsControllerTest < ActionController::TestCase
  setup do
    @user_smart_point = user_smart_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_smart_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_smart_point" do
    assert_difference('UserSmartPoint.count') do
      post :create, user_smart_point: { date: @user_smart_point.date, spoint_mac: @user_smart_point.spoint_mac, user_mac: @user_smart_point.user_mac }
    end

    assert_redirected_to user_smart_point_path(assigns(:user_smart_point))
  end

  test "should show user_smart_point" do
    get :show, id: @user_smart_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_smart_point
    assert_response :success
  end

  test "should update user_smart_point" do
    patch :update, id: @user_smart_point, user_smart_point: { date: @user_smart_point.date, spoint_mac: @user_smart_point.spoint_mac, user_mac: @user_smart_point.user_mac }
    assert_redirected_to user_smart_point_path(assigns(:user_smart_point))
  end

  test "should destroy user_smart_point" do
    assert_difference('UserSmartPoint.count', -1) do
      delete :destroy, id: @user_smart_point
    end

    assert_redirected_to user_smart_points_path
  end
end
