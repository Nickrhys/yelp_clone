require 'rails_helper'

describe 'reviewing' do
	before do
	Restaurant.create(name: 'Pizza Pilgrims')
	end

	it 'allows users to leave reviews using a form whih will appear alongside restaurants' do

		visit 'restaurants'
		click_link 'Review Pizza Pilgrims'
		fill_in "Review", with: "excellent"
		select '5', from: 'Rating'
		click_button 'Leave review'
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'excellent'
	end
end	