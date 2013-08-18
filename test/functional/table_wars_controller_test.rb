require 'test_helper'

class TableWarsControllerTest < ActionController::TestCase
  setup do
    @table_war = table_wars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:table_wars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create table_war" do
    assert_difference('TableWar.count') do
      post :create, table_war: {  }
    end

    assert_redirected_to table_war_path(assigns(:table_war))
  end

  test "should show table_war" do
    get :show, id: @table_war
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @table_war
    assert_response :success
  end

  test "should update table_war" do
    put :update, id: @table_war, table_war: {  }
    assert_redirected_to table_war_path(assigns(:table_war))
  end

  test "should destroy table_war" do
    assert_difference('TableWar.count', -1) do
      delete :destroy, id: @table_war
    end

    assert_redirected_to table_wars_path
  end
end
