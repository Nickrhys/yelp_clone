require 'spec_helper'
	
RSpec.describe Review, :type => :model do 
	it "should not have a rating higher than 5"  do 
		restaurant = Restaurant.new(name: 'Pizza Pilgrims')
		review = Review.new(review: 'excellent', rating: '100')
		expect(review).to have(1).error_on(:rating)
	end	
end	