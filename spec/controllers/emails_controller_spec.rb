require 'spec_helper'

describe EmailsController do
	subject { post :create, text: "this is email text" }

	it "should have successful response" do
		subject
		response.should be_success
	end

	it "should be have json response" do
		subject
		puts response.body
		@expected = { text: "this is email text" }.to_json
		response.body.should == @expected
	end

end
