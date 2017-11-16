require "rails_helper"

feature "Venue Index Page:" do

  scenario "list all venues that user bookmarked dishes for", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)

    american_cuisine = create(:cuisine_with_dishes)
    dish_1 = american_cuisine.dishes.first
    venue_1 = create(:venue, neighborhood: create(:neighborhood))
    bookmark_1 = create(:bookmark, user_id: user.id, dish_id: dish_1.id, venue_id: venue_1.id)

    breakfast_cuisine = create(:cuisine_with_dishes)
    dish_2 = breakfast_cuisine.dishes.first
    venue_2 = create(:venue, neighborhood: create(:neighborhood))
    bookmark_2 = create(:bookmark, user_id: user.id, dish_id: dish_2.id, venue_id: venue_2.id)

    italian_cuisine = create(:cuisine_with_dishes)
    dish_3 = italian_cuisine.dishes.first
    venue_3 = create(:venue, neighborhood: create(:neighborhood))

    visit "/venues"

    expect(page).to have_content(venue_1.name)
    expect(page).to have_content(venue_2.name)
    expect(page).not_to have_content(venue_3.name)
  end

  scenario "user can able to filter venue with neighborhood", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)

    american_cuisine = create(:cuisine_with_dishes)
    dish_1 = american_cuisine.dishes.first
    neighborhood_1 = create(:neighborhood)
    venue_1 = create(:venue, neighborhood: neighborhood_1)
    bookmark_1 = create(:bookmark, user_id: user.id, dish_id: dish_1.id, venue_id: venue_1.id)

    breakfast_cuisine = create(:cuisine_with_dishes)
    dish_2 = breakfast_cuisine.dishes.first
    venue_2 = create(:venue, neighborhood: neighborhood_1)
    bookmark_2 = create(:bookmark, user_id: user.id, dish_id: dish_2.id, venue_id: venue_2.id)

    italian_cuisine = create(:cuisine_with_dishes)
    dish_3 = italian_cuisine.dishes.first
    neighborhood_2 = create(:neighborhood)
    venue_3 = create(:venue, neighborhood: neighborhood_2)

    visit "/venues"

    page.find(:css, "a", text: "Show Filters").click
    fill_in('Neighborhood name contains', :with => neighborhood_1.name)
    page.find("#venues_filters").find("input[type='submit']").click
    
    neighborhood_1.venues.each do |venue|
      expect(page).to have_content(venue.name)
    end

    neighborhood_2.venues.each do |venue|
      expect(page).not_to have_content(venue.name)
    end

  end

  scenario "user can able to filter venue with bookmarked dish", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)

    american_cuisine = create(:cuisine_with_dishes)
    dish_1 = american_cuisine.dishes.first
    neighborhood_1 = create(:neighborhood)
    venue_1 = create(:venue, neighborhood: neighborhood_1)
    bookmark_1 = create(:bookmark, user_id: user.id, dish_id: dish_1.id, venue_id: venue_1.id)

    breakfast_cuisine = create(:cuisine_with_dishes)
    neighborhood_2 = create(:neighborhood)
    venue_2 = create(:venue, neighborhood: neighborhood_2)
    bookmark_2 = create(:bookmark, user_id: user.id, dish_id: dish_1.id, venue_id: venue_2.id)

    italian_cuisine = create(:cuisine_with_dishes)
    dish_2 = italian_cuisine.dishes.first
    neighborhood_3 = create(:neighborhood)
    venue_3 = create(:venue, neighborhood: neighborhood_3)
    bookmark_2 = create(:bookmark, user_id: user.id, dish_id: dish_2.id, venue_id: venue_3.id)

    visit "/venues"
    
    page.find(:css, "a", text: "Show Filters").click
    fill_in('Bookmarked dish name contains', :with => dish_1.name)
    page.find("#venues_filters").find("input[type='submit']").click

    dish_1.specialists.each do |venue|
      expect(page).to have_content(venue.name)
    end

    dish_2.specialists.each do |venue|
      expect(page).not_to have_content(venue.name)
    end
  end
end
