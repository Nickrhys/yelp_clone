require 'rails_helper'

describe 'restaurants' do
	context 'no restaurant have been added' do
    it 'should display a prompt to add a restaurant' do 
      visit '/restaurants'
      expect(page).to have_content 'No restaurants'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do 
      Restaurant.create(name: 'Pizza Pilgrims')
    end
    
    it 'should display restaurants' do  
      visit '/restaurants' 
        expect(page).to have_content('Pizza Pilgrims')
        expect(page).not_to have_content('No restaurants yet')
      end
    end 

describe 'creating restaurants' do 
    it 'prompts a user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Pizza Pilgrims'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Pizza Pilgrims'
      expect(current_path).to eq '/restaurants'
    end 
  end

describe 'editing restaurants' do
  before do 
    Restaurant.create(name:'Pizza Pilgrims')
  end
  

    it 'can allow a user to edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit Pizza Pilgrims'
      fill_in "Name", with: 'Pizza Pilgrims Dean Street'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Pizza Pilgrims Dean Street'
      expect(current_path).to eq '/restaurants'
    end  
  end

  decribe 'deleting restaurants' do 
    before do 
    Restaurant.create(name:'Pizza Pilgrims')
  end

  it 'removes a restaurant when a user clicks a delete link' do 
      visit '/restaurants'
      click_link 'Delete Pizza Pilgrims'
      expect(page).not_to have_content 'Pizza Pilgrims'
      expect(page).to have_content 'Restaurant deleted successfully'
  end

end
