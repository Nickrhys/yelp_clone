require 'rails_helper'

describe ReviewsHelper, :type => :helper do 
	context '#star_rating' do 
		it "does nothing for not a number" do 
			expect(helper.star_rating('N/A')).to eq 'N/A'
		end 

		it "returns 5 black stars for 5" do 
			expect(helper.star_rating(5)).to eq "★★★★★"
 		end	

 		it "returns 3 black stars and 2 white stars for 3" do 
 			expect(helper.star_rating(3)).to eq "★★★☆☆"
 		end

		it "rounds to the nearest star for whole numbers" do
			expect(helper.star_rating(3.5)).to eq "★★★★☆"
		end
 	end	

 	context '#time_ago_in_words' do 
 		it "returns less than a minute when review posted" do 
 			expect(helper.time_ago_in_words(Time.now)).to eq "less than a minute"
 		end
 	end
end