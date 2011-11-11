require 'test_helper'

class VotingRoundsControllerTest < ActionController::TestCase
  setup do
    @voting_round = voting_rounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voting_rounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voting_round" do
    assert_difference('VotingRound.count') do
      post :create, :voting_round => @voting_round.attributes
    end

    assert_redirected_to voting_round_path(assigns(:voting_round))
  end

  test "should show voting_round" do
    get :show, :id => @voting_round.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @voting_round.to_param
    assert_response :success
  end

  test "should update voting_round" do
    put :update, :id => @voting_round.to_param, :voting_round => @voting_round.attributes
    assert_redirected_to voting_round_path(assigns(:voting_round))
  end

  test "should destroy voting_round" do
    assert_difference('VotingRound.count', -1) do
      delete :destroy, :id => @voting_round.to_param
    end

    assert_redirected_to voting_rounds_path
  end
end
