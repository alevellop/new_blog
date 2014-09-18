require 'spec_helper'

describe Post do
	
	before do
		@post = Post.new(title: "New post", body: "This is a description")
	end

	subject {@post}

	it {should respond_to(:title)}
	it {should respond_to(:body)}

	it {should be_valid}

	describe "with title is not present" do
		before {@post.title=""}

		it {should_not be_valid}
	end
end

