require 'spec_helper'

describe Post do
	let(:post) { FactoryGirl.create(:post) } 

	before do
		@comment = post.comments.new(author: "Rob", body: "This is a comment")
	end

	subject {@comment}

	it {should respond_to(:author)}
	it {should respond_to(:body)}

	it {should be_valid}

	describe "with author is not present" do
		before {@comment.author=""}

		it {should_not be_valid}
	end

	describe "with body is not present" do
		before {@comment.body=""}

		it {should_not be_valid}
	end
end

