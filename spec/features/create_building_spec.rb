require 'spec_helper'

feature 'create a building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

# Acceptance Criteria:

# * I must specify a street address, city, state, and postal code
# * Only US states can be specified
# * I can optionally specify a description of the building
# * If I enter all of the required information in the 
#   required format, the building is recorded.
# * If I do not specify all of the required information in 
#   the required formats, the building is not recorded and 
#   I am presented with errors
# * Upon successfully creating a building, I am redirected 
#   so that I can record another building.

  before(:each) do
    @owner = FactoryGirl.create(:owner)
  end

  scenario 'with valid attributes' do
    prev_count = Building.count
    visit owner_path(@owner)
    click_on 'Add a Building'

    fill_in 'Street Address', with: '33 Harrison Ave'
    fill_in 'City', with: 'Boston'
    select 'MA', from: 'State'
    fill_in 'Postal Code', with: '02355'
    click_button 'Add Building'

    expect(page).to have_content('Building added!')
    expect(page).to have_content('Add Building')
    expect(Building.count).to eq(prev_count + 1)
  end

  scenario 'with invalid attributes' do
    prev_count = Building.count
    visit owner_path(@owner)
    click_on 'Add a Building'

    click_button 'Add Building'
    expect(page).to_not have_content('Building added!')
    expect(page).to have_content "can't be blank"
    expect(Building.count).to eq(prev_count)
  end
end