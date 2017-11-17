require "rails_helper"

feature "/venues/:id" do

  scenario "shows the signed in user's bookmarked dishes", points: 5 do
    user = create(:user)
    neighborhood = create(:neighborhood)
    venue_1 = create(:venue, neighborhood: neighborhood)
    venue_2 = create(:venue, neighborhood: neighborhood)

    cuisine_1 = create(:cuisine_with_dishes)
    dish_1 = cuisine_1.dishes.first
    bookmark_1 = create(:bookmark, user_id: user.id, dish_id: dish_1.id, venue_id: venue_1.id)

    cuisine_2 = create(:cuisine_with_dishes)
    dish_2 = cuisine_2.dishes.first
    bookmark_2 = create(:bookmark, user_id: user.id, dish_id: dish_2.id, venue_id: venue_2.id)

    login_as(user, :scope => :user)
    visit "/venues/#{venue_1.id}"

    expect(page).to have_selector("a", text: bookmark_1.dish.name)
    expect(page).to_not have_selector("a", text: bookmark_2.dish.name)
  end

  scenario "can add a new bookmarked dish to the venue", points: 2 do
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
end
