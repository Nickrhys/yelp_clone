require 'rails_helper'

describe 'reviewing' do
	before do
	Restaurant.create(name: 'Pizza Pilgrims')
	end

	def leave_review(review, rating)
		visit '/restaurants'
		click_link 'Review Pizza Pilgrims'
		fill_in "Review", with: review
		select rating, from: 'Rating'
		click_button 'Leave review'
	end

	it 'allows users to leave reviews using a form which will appear alongside restaurants' do
		leave_review("excellent", "5")
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'excellent'
	end

	it 'displays an average rating for all reviews' do 
		leave_review('so so', "3")
		leave_review('great', "5")
		expect(page).to have_content("Average rating: ★★★★☆")  
	end 

	it 'displays the how long it has been since a review was written' do 
		leave_review("excellent", "5")
		expect(page).to have_content("less than a minute")
	end
end	
