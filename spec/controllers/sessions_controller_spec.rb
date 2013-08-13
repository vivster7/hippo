require 'spec_helper'

describe SessionsController do
  describe "create" do
    it "should read auth data from the session environment" do
      request.env['omniauth.auth'] = {info: {email: "test@example.com"}}
      get :create, provider: "gplus"
      response.should redirect_to(root_path)
      session[:user_id].should == User.first.to_param
    end

    it "should recognize if there is pending_text in the session" do
    	request.env['omniauth.auth'] = {info: {email: "test@example.com"}}
    	session[:pending_text] = "This is pending text"
    	get :create, provider: "gplus"
    	Email.last.text.should == "This is pending text"
  	end
  end
end
