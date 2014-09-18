require 'rails_helper'

describe "PostsControllers" do

	subject {page}

	describe "#index" do
		let!(:post) { FactoryGirl.create(post) }

		before{visit root_path}

		it{should have_content("Listing posts")}
		it{should have_content(post.title)}
		it{should have_content(post.created_at)}
		it{should have_link('Show', post_path(post))}
		it{should have_link('New Post', new_post_path)}
	end

	describe "#show" do
		let!(:post) { FactoryGirl.create(post) }

		before{visit post_path(post)}

			
		describe "should show elements" do
			it{should have_content(post.title)}
			it{should have_content(post.body)}
			it{should have_content(post.created_at)}
			it{should have_link('Edit', edit_post_path(post))}
			it{should have_link('Back', root_path)}
		end

		describe "should show comment" do
			let!(:comment) { post.create!(author: "User", body: "This is a comment") }
			before {visit post_path(post)}

			it{should have_content('User')}
			it{should have_content('This is a commenet')}
		end
	end

	describe "#new" do
		before {visit new_post_path}

		describe "should show elements" do
			it{should have_content("Listing posts")}
			it{should have_selector('input#post_title')}
			it{should have_selector('input#post_body')}
			it{should have_selector('input', name: 'commit', value: 'Create Post')}
			it{should have_link('Back', root_path)}
		end

		describe "with invalid information" do
			let(:submit) { "Create Post" }
			
			it "should not create a user" do
				expect { click_button submit }.not_to change(Post, :count)
			end
		end

		describe "with valid information" do
			let(:submit) { "Create Post" }
			
			before do
				fill_in "Title", with: "This is a title"
				fill_in "Body", with: "This is a description"
			end

			it "should create a user" do
				expect { click_button submit }.to change(Post, :count).by(1)
			end
		end
	end

	describe "#edit" do
		let(:post) { FactoryGirl.create(post) } 

		before {visit edit_post_paht(post)}

		describe "should show elements" do
			it {should have_content(post.title)}
			it {should have_content(post.body)}
		end

		describe "with valid information" do
			let(:new_title) { "new title" }

			before {fill_in "Title", with: new_title}

			it {should have_content(new_title)}

			specify { expect(post.reload.title).to eq new_title}
		end
	end

	describe "#destroy" do
		let(:post) { FactoryGirl.create(post) }

		before {visit post_path(post)}

		it "should destroy post" do
			expect { click_button "Destroy"}.to change(Post, :count).by(-1)
		end
	end
end
