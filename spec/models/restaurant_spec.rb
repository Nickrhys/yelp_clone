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
end