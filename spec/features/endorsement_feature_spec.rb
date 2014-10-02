require 'rails_helper'

describe 'endorsing reviews' do
	before do
		kfc = Restaurant.create(name: 'KFC')
		kfc.reviews.create(rating: 3, review: "ok")
	end 

	it "can endorse a review updating the review endorsement count", js: true do
		visit '/restaurants'
		click_link 'Endorse this review'
		expect(page).to have_content '1 endorsement'
	end

	it "will pluralize the number of endorsements when it is greater than 1", js: true do 
		visit '/restaurants'
		click_link 'Endorse this review'
		click_link 'Endorse this review'
		expect(page).to have_content '2 endorsements'
	end

end