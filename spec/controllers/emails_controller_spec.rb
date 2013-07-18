require 'spec_helper'

describe EmailsController do
	subject { post :create, :email => { text: "this is email text" } }

	it "should have successful response" do
		subject
		expect(response).to be_success
		expect(response.status).to eq(200)
	end

	# it "should be have json response" do
	# 	subject
	# 	@expected = { text: "this is email text" }.to_json
	# 	response.body.should == @expected
	# end

	# it "should have url in json response no matter the request" do
	# 	subject
	# 	@expected = { url: "localhost:3000/assets/american-gothic.jpg" }.to_json
	# 	response.body.should == @expected
	# end

	context "the image in the email" do
		before do
			subject
		end

		it "should exist" do
			expect(response.body).to match /src=/
		end

		it "should have an ugly url" do 
			#regex matching /:id
			expect(response.body).to_not match /(\/\d+)/
		end
	end


end
