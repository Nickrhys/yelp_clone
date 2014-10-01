require 'spec_helper'

RSpec.describe Restaurant, :type => :model do 
	it "is not valid with a name of less than 3 characters" do 
		restaurant = Restaurant.new(name: 'Pi')
		expect(restaurant).to have(1).error_on(:name)
		expect(restaurant).not_to be_valid
	end

	it "is not valid unless it is a unique name" do 
		Restaurant.create(name: "Pizza Pilgrims")
		restaurant = Restaurant.new(name: "Pizza Pilgrims")
		expect(restaurant).to have(1).error_on(:name)
	end

	describe '#average_rating' do 
		context 'no reviews' do 
			it 'returns N/A' do
					restaurant = Restaurant.create(name: "Pizza Pilgrims")
				expect(restaurant.average_rating).to eq 'N/A'
			end

		end

		context '1 review' do 
			it "retirns that rating" do 
				restaurant = Restaurant.create(name: "Pizza Pilgrims")
				restaurant.reviews.create(rating: 4)
				expect(restaurant.average_rating).to eq 4
			end
		end

		context 'multiple reviews' do 
			it 'returns the average' do
			 restaurant = Restaurant.create(name: "Pizza Pilgrims")
			 restaurant.reviews.create(rating: 5)
			 restaurant.reviews.create(rating: 3)
			 expect(restaurant.average_rating).to eq 4
			end
		end
	end

end