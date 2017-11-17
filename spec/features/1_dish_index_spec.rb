require "rails_helper"

feature "/dishes" do

  scenario "is the homepage and links to each dish", points: 2 do
    user = create(:user)
    login_as(user, :scope => :user)

    cuisines = create_list(:cuisine_with_dishes, 2)

    visit "/"

    Dish.all.each do |dish|
      expect(page).to have_selector("a", text: dish.name)
    end
  end

  scenario "displays venue for each dish", points: 4 do
    user = create(:user)
    cuisine = create(:cuisine_with_dishes)
    venue = create(:venue, neighborhood: create(:neighborhood))
    bookmark = create(:bookmark, user_id: user.id, dish_id: cuisine.dishes.first.id, venue_id: venue.id)

    login_as(user, :scope => :user)
    visit "/"

    expect(page).to have_content(bookmark.venue.name)
  end

  scenario "allows adding a new favorite venue for a dish", points: 6 do
    user = create(:user)
    login_as(user, :scope => :user)

    american_cuisine = create(:cuisine_with_dishes)
    dish = american_cuisine.dishes.first
    venue = create(:venue, neighborhood: create(:neighborhood))
    visit "/"

    row = page.find(:css, "tr", text: dish.name )
    row.find("td:eq(2)").select(venue.name)
    row.find("button").click

    expect(dish.bookmarks.first.venue.id).to eq(venue.id)
  end

  scenario "user can filter dishes by cuisine", points: 2 do
    user = create(:user)
    login_as(user, :scope => :user)

    american_cuisine = create(:cuisine_with_dishes)
    breakfast_cuisine = create(:cuisine_with_dishes)

    visit "/"
    page.find(:css, "a", text: "Show Filters").click
    page.find(:css, "label", text: american_cuisine.name).click
    page.find("#dishes_filters").find("input[type='submit']").click

    american_cuisine.dishes.each do |dish|
      expect(page).to have_content(dish.name)
    end

    breakfast_cuisine.dishes.each do |dish|
      expect(page).not_to have_content(dish.name)
    end

  end

  scenario "can filter dishes by name", points: 2 do
    user = create(:user)
    login_as(user, :scope => :user)

    american_cuisine = create(:cuisine_with_dishes)
    breakfast_cuisine = create(:cuisine_with_dishes)

    visit "/"
    fill_in('Name contains', :with => breakfast_cuisine.dishes.first.name)

    page.find("#dishes_filters").find("input[type='submit']").click

    breakfast_cuisine.dishes.each do |dish|
      expect(page).to have_content(dish.name)
    end

    american_cuisine.dishes.each do |dish|
      expect(page).not_to have_content(dish.name)
    end
  end

  scenario "has a link to a new venue", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)
    visit "/"
    expect(page).to have_selector('a[href="/venues/new"]')
  end

end
