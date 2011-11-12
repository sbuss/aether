require 'test_helper'

class SmileysControllerTest < ActionController::TestCase
  setup do
    @smiley = smileys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smileys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smiley" do
    assert_difference('Smiley.count') do
      post :create, :smiley => @smiley.attributes
    end

    assert_redirected_to smiley_path(assigns(:smiley))
  end

  test "should show smiley" do
    get :show, :id => @smiley.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @smiley.to_param
    assert_response :success
  end

  test "should update smiley" do
    put :update, :id => @smiley.to_param, :smiley => @smiley.attributes
    assert_redirected_to smiley_path(assigns(:smiley))
  end

  test "should destroy smiley" do
    assert_difference('Smiley.count', -1) do
      delete :destroy, :id => @smiley.to_param
    end

    assert_redirected_to smileys_path
  end
end
