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
			it "should exist/save the email/ have an ugly url" do
				subject
				expect(response.body).to match /src=/
				expect(Email.last.text).to eq("this is email text")				
				expect(Nokogiri.parse(response.body).css('img').first.attribute('src').value).to match(/#{Email.last.ugly_image_id}/)
			end
		end

		describe "GET #authorized show" do
			context "before basic_auth access" do
				before do
					subject
					get :authorized_show, { id: Email.last.id, image: Email.last.image }
				end

				it "should be unauthorized" do
					expect(response.status).to eq(401)
				end
			end

			context "with basic_auth access" do
				before do
					subject
    			request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('gollum','smeagol')
					get :authorized_show, { id: Email.last.id, image: Email.last.image }
				end

				it "should see the image/should increase the view count" do
					expect(:send_file)
					expect { get :authorized_show, { id: Email.last.id, image: Email.last.image } }.to change{Email.last.users.count}.by(1)
				end
			end
		end

		describe "GET #history" do
			render_views
			before do
				subject
  			request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('gollum','smeagol')
				get :authorized_show, { id: Email.last.id, image: Email.last.image }
				get :history, { id: Email.last.id, image: Email.last.image }
			end

			it "should have some text" do
				expect(Nokogiri.parse(response.body).search('li').inner_text()).to match(users(:default).name)
			end
		end
	end
end
