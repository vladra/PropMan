require 'test_helper'

class SuersControllerTest < ActionController::TestCase
  setup do
    @suer = suers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suer" do
    assert_difference('Suer.count') do
      post :create, suer: { email: @suer.email, login: @suer.login, name: @suer.name }
    end

    assert_redirected_to suer_path(assigns(:suer))
  end

  test "should show suer" do
    get :show, id: @suer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @suer
    assert_response :success
  end

  test "should update suer" do
    patch :update, id: @suer, suer: { email: @suer.email, login: @suer.login, name: @suer.name }
    assert_redirected_to suer_path(assigns(:suer))
  end

  test "should destroy suer" do
    assert_difference('Suer.count', -1) do
      delete :destroy, id: @suer
    end

    assert_redirected_to suers_path
  end
end
