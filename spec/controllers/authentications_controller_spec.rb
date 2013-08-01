require 'spec_helper'

describe AuthenticationsController do

  before(:each) do
    @authentication = FactoryGirl.create(:authenticated)
  end

  it "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authentications)
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create authentication" do
    assert_difference('Authentication.count') do
      post :create, :authentication => @authentication.attributes
    end

    assert_redirected_to authentication_path(assigns(:authentication))
  end

  it "should show authentication" do
    get :show, :id => @authentication.to_param
    assert_response :success
  end

  it "should get edit" do
    get :edit, :id => @authentication.to_param
    assert_response :success
  end

  it "should update authentication" do
    put :update, :id => @authentication.to_param, :authentication => @authentication.attributes
    assert_redirected_to authentication_path(assigns(:authentication))
  end

  it "should destroy authentication" do
    assert_difference('Authentication.count', -1) do
      delete :destroy, :id => @authentication.to_param
    end

    assert_redirected_to authentications_path
  end

end