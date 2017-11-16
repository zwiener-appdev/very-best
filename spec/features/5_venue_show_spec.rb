require "rails_helper"

feature "Venue show Page:" do

  scenario "shows users bookmarked dishes", points: 1 do
    user_1 = create(:user)
    login_as(user_1, :scope => :user)

    american_cuisine = create(:cuisine_with_dishes)
    dish_1 = american_cuisine.dishes.first
    neighborhood_1 = create(:neighborhood)
    venue_1 = create(:venue, neighborhood: neighborhood_1)
    bookmark_1 = create(:bookmark, user_id: user_1.id, dish_id: dish_1.id, venue_id: venue_1.id)
    
    breakfast_cuisine = create(:cuisine_with_dishes)
    dish_2 = breakfast_cuisine.dishes.first
    neighborhood_2 = create(:neighborhood)
    bookmark_2 = create(:bookmark, user_id: user_1.id, dish_id: dish_2.id, venue_id: venue_1.id)

    italian_cuisine = create(:cuisine_with_dishes)
    dish_3 = italian_cuisine.dishes.first
    user_2 = create(:user)
    neighborhood_3 = create(:neighborhood)
    venue_2 = create(:venue, neighborhood: neighborhood_3)
    bookmark_3 = create(:bookmark, user_id: user_1.id, dish_id: dish_3.id, venue_id: venue_1.id)

    visit "/venues/#{venue_1.id}"

    venue_1.bookmarks.where(:user_id => user_1.id).each do |bookmark|
      expect(page).to have_selector("li.user_bookmarked_dish", text: bookmark.dish.name)
    end

  end

  scenario "can add a new bookmarked dish to the venue", points: 1 do
    user_1 = create(:user)
    login_as(user_1, :scope => :user)

    american_cuisine = create(:cuisine_with_dishes)
    dish_1 = american_cuisine.dishes.first
    neighborhood_1 = create(:neighborhood)
    venue_1 = create(:venue, neighborhood: neighborhood_1)
    bookmark_1 = create(:bookmark, user_id: user_1.id, dish_id: dish_1.id, venue_id: venue_1.id)
    
    breakfast_cuisine = create(:cuisine_with_dishes)
    dish_2 = breakfast_cuisine.dishes.first
    neighborhood_2 = create(:neighborhood)

    italian_cuisine = create(:cuisine_with_dishes)
    dish_3 = italian_cuisine.dishes.first
    user_2 = create(:user)
    neighborhood_3 = create(:neighborhood)
    venue_2 = create(:venue, neighborhood: neighborhood_3)
    bookmark_3 = create(:bookmark, user_id: user_1.id, dish_id: dish_3.id, venue_id: venue_1.id)

    visit "/venues/#{venue_1.id}"


    page.find("#dish_id").select(dish_2.name)
    page.find("form button").click

    expect(Bookmark.find_by(user_id: user_1.id, venue_id: venue_1.id, dish_id: dish_2.id)).to be_present
  end

  scenario "shows other users bookmarked dishes", points: 1 do
    user_1 = create(:user)
    login_as(user_1, :scope => :user)

    american_cuisine = create(:cuisine_with_dishes)
    dish_1 = american_cuisine.dishes.first
    neighborhood_1 = create(:neighborhood)
    venue_1 = create(:venue, neighborhood: neighborhood_1)
    bookmark_1 = create(:bookmark, user_id: user_1.id, dish_id: dish_1.id, venue_id: venue_1.id)
    
    breakfast_cuisine = create(:cuisine_with_dishes)
    dish_2 = breakfast_cuisine.dishes.first
    neighborhood_2 = create(:neighborhood)
    bookmark_2 = create(:bookmark, user_id: user_1.id, dish_id: dish_2.id, venue_id: venue_1.id)

    italian_cuisine = create(:cuisine_with_dishes)
    dish_3 = italian_cuisine.dishes.first
    user_2 = create(:user)
    neighborhood_3 = create(:neighborhood)
    venue_2 = create(:venue, neighborhood: neighborhood_3)
    bookmark_3 = create(:bookmark, user_id: user_1.id, dish_id: dish_3.id, venue_id: venue_1.id)

    visit "/venues/#{venue_1.id}"

    venue_1.bookmarks.where(:user_id => user_2.id).each do |bookmark|
      expect(page).to have_selector("li.specialties", text: bookmark.dish.name)
    end

  end
end
