require 'spec_helper'
	
RSpec.describe Review, :type => :model do 
	it "should not have a rating higher than 5"  do 
		restaurant = Restaurant.new(name: 'Pizza Pilgrims')
		review = Review.new(review: 'excellent', rating: '100')
		expect(review).to have(1).error_on(:rating)
	end	

	# can put in test for numbers below 1 and to check it validates numbers between 1 and 5 too. 
end	