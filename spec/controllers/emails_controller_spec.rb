require 'spec_helper'

describe EmailsController do
	subject { post :create, :email => { text: "this is email text" } }

	it "should have successful response" do
		subject
		response.should be_success
	end

	it "should be have json response" do
		subject
		@expected = { text: "this is email text" }.to_json
		response.body.should == @expected
	end

	it "should have url in json response no matter the request" do
		subject
		@expected = { url: "localhost:3000/assets/american-gothic.jpg" }.to_json
		response.body.should == @expected
	end

end
