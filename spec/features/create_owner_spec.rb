require 'spec_helper'

feature 'create a building', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

# Acceptance Criteria:

# * I must specify a first name, last name, and email address
# * I can optionally specify a company name
# * If I do not specify the required information, I am presented with errors
# * If I specify the required information, the owner is recorded 
#   and I am redirected to enter another new owner

  scenario 'with valid attributes' do
    prev_count = Owner.count
    visit owners_path
    click_on 'Add an Owner'

    fill_in 'First Name', with: 'Bruce'
    fill_in 'Last Name', with: 'Lee'
    fill_in 'Email', with: 'blee@gmail.com'
    fill_in 'Company Name', with: 'Taichi Arts'
    click_button 'Add Owner'

    expect(page).to have_content('Owner added!')
    expect(page).to have_content('Add Owner')
    expect(Owner.count).to eq(prev_count + 1)
  end

  scenario 'with invalid attributes' do
    prev_count = Owner.count
    visit owners_path
    click_on 'Add an Owner'

    click_button 'Add Owner'

    expect(page).to have_content("can't be blank")
    expect(page).to have_content('Add Owner')
    expect(Owner.count).to eq(prev_count)
  end
end