require 'spec_helper'

describe User do
  describe "#find_or_create_from_auth_hash" do
  	subject do
  		User.find_or_create_from_auth_hash(auth_hash)
  	end

  	context "when a matching user exists" do
  		let(:auth_hash) {{ email: "test@example.com"}}

  		it "should not create another user" do
  			expect { subject }.not_to change(User, :count)
  			subject.should == User.first
  		end
  	end

  	context "when no matching user exists" do
  		let(:auth_hash) {{email: "nomatch@example.com" }}

  		it "should create a new user" do
  			expect { subject }.to change(User, :count)
  			subject.should == User.last
  		end
  	end

  	context "when creating with the incorrect domain" do
  		let(:auth_hash) {{ email: "test@notexample.com" }}

  		it "should not create a new user" do
  			expect { subject }.not_to change(User, :count)
  		end
  	end

  	context "when the hash is bad" do
  		let(:auth_hash) { nil }

  		it "should raise an error" do
  			expect { subject }. to raise_error
  		end
  	end
  end
end
