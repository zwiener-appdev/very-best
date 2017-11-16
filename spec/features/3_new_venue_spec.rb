require "rails_helper"

feature "New Venue Page:" do
  scenario "user can able create a new venue with name and neighborhood", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)
    neighborhood = create(:neighborhood)
    visit "/venues/new"

    fill_in('Name', :with => 'Rangoli')
    page.find("#neighborhood_id").select(neighborhood.name)

    click_button('Create Venue')

    expect(Venue.find_by(name: 'Rangoli')).to be_present
  end

  scenario "user can able create a new venue with name and address and neighborhood", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)
    neighborhood = create(:neighborhood)
    visit "venues/new"

    fill_in('Name', :with => 'Rangoli')
    fill_in('Address', :with => 'Chicago')
    page.find("#neighborhood_id").select(neighborhood.name)

    click_button('Create Venue')
    
    expect(Venue.find_by(name: 'Rangoli', address: 'Chicago')).to be_present
  end
end
