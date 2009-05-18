require 'test_helper'

class NewslettersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newsletters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newsletter" do
    assert_difference('Newsletter.count') do
      post :create, :newsletter => { }
    end

    assert_redirected_to newsletter_path(assigns(:newsletter))
  end

  test "should show newsletter" do
    get :show, :id => newsletters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => newsletters(:one).to_param
    assert_response :success
  end

  test "should update newsletter" do
    put :update, :id => newsletters(:one).to_param, :newsletter => { }
    assert_redirected_to newsletter_path(assigns(:newsletter))
  end

  test "should destroy newsletter" do
    assert_difference('Newsletter.count', -1) do
      delete :destroy, :id => newsletters(:one).to_param
    end

    assert_redirected_to newsletters_path
  end
end
