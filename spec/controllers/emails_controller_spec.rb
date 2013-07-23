require 'spec_helper'

describe EmailsController do
	subject { post :create, :email => { text: "this is email text" } }

	context "before logging in with a google account" do
		it "should be redirected to the google page" do
			subject
			expect(response.status).to eq(302)
		end
	end

	context "after logged in" do
		before do
			session[:user_id] = User.first.to_param
		end

		it { should be_success }

		describe "POST #create" do
			it "should exist" do
				subject
				expect(response.body).to match /src=/
			end

			it "should have an ugly url" do 
				subject
				#regex matching /:id
				expect(response.body).to_not match /(\/\d+)/
			end
		end
	end
end
