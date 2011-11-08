require 'test_helper'

class JukeboxesControllerTest < ActionController::TestCase
  setup do
    @jukebox = jukeboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jukeboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jukebox" do
    assert_difference('Jukebox.count') do
      post :create, :jukebox => @jukebox.attributes
    end

    assert_redirected_to jukebox_path(assigns(:jukebox))
  end

  test "should show jukebox" do
    get :show, :id => @jukebox.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @jukebox.to_param
    assert_response :success
  end

  test "should update jukebox" do
    put :update, :id => @jukebox.to_param, :jukebox => @jukebox.attributes
    assert_redirected_to jukebox_path(assigns(:jukebox))
  end

  test "should destroy jukebox" do
    assert_difference('Jukebox.count', -1) do
      delete :destroy, :id => @jukebox.to_param
    end

    assert_redirected_to jukeboxes_path
  end
end
