FactoryGirl.define do
	factory :post, class: Post do
		sequence(:title)		{ |n| "This is a post number #{n}" }
		sequence(:body)	{ |n| "Sed ut perspiciatis unde omnis iste natus error 
													sit voluptatem accusantium doloremque laudantium, 
													totam rem aperiam, eaque ipsa quae ab illo inventore 
													veritatis et quasi architecto beatae vitae dicta." }
	end

end