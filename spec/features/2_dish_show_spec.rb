require "rails_helper"

feature "Dish Show Page:" do
  scenario "user can bookmark a new venue for the dish", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)
    american_cuisine = create(:cuisine_with_dishes)
    dish = american_cuisine.dishes.first
    venue = create(:venue, neighborhood: create(:neighborhood))
    visit "/dishes/#{dish.id}"
    page.find("#venue_id").select(venue.name)
    page.find('form button').click
    
    expect(dish.bookmarks.first.venue.id).to eq(venue.id)
  end

  scenario "list all the venues for the dish in the past", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)

    american_cuisine = create(:cuisine_with_dishes)
    dish = american_cuisine.dishes.first

    venue_1 = create(:venue, neighborhood: create(:neighborhood))
    venue_2 = create(:venue, neighborhood: create(:neighborhood))
    venue_3 = create(:venue, neighborhood: create(:neighborhood))

    bookmark = create(:bookmark, user_id: user.id, dish_id: dish.id, venue_id: venue_1.id)
    bookmark = create(:bookmark, user_id: user.id, dish_id: dish.id, venue_id: venue_2.id)

    visit "/dishes/#{dish.id}"
    expect(page).to have_selector("p", text: venue_1.name)
    expect(page).to have_selector("p", text: venue_2.name)
    expect(page).not_to have_selector("p", text:venue_3.name)

  end
end
