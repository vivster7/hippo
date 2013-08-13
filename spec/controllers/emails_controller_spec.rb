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
			session[:user_id] = users(:default)
		end

		it { should be_success }

		describe "POST #create" do
			render_views
			it "should exist" do
				subject
				expect(response.body).to match /src=/
			end

			it "should have an ugly url" do 
				subject
				expect(Email.last.text).to eq("this is email text")				
				expect(response.body).to_not match /^\/\d{1,3}$/
				expect(Nokogiri.parse(response.body).css('img').first.attribute('src').value).to match(/#{Email.last.ugly_image_id}/)
			end
		end
	end
end
