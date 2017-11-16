require "rails_helper"

feature "Dish Index Page:" do

  scenario "list all dishes", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)
    
    american_cuisine = create(:cuisine_with_dishes)
    breakfast_cuisine = create(:cuisine_with_dishes)

    visit "/"

    (american_cuisine.dishes + breakfast_cuisine.dishes).each do |dish|
      expect(page).to have_content(dish.name)
    end
  end

  scenario "displays venue for each dish", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)
    american_cuisine = create(:cuisine_with_dishes)
    venue = create(:venue, neighborhood: create(:neighborhood))
    bookmark = create(:bookmark, user_id: user.id, dish_id: american_cuisine.dishes.first.id, venue_id: venue.id)
    visit "/"
    expect(page).to have_content(bookmark.venue.name)
  end

  scenario "user can select venue if already not found for dish", points: 1 do
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

  scenario "user can filter dishes by cuisine", points: 1 do
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

  scenario "user can search dished by name", points: 1 do
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

  scenario "user can add a new venue dished by name", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)
    visit "/"
    expect(page).to have_selector('a[href="/venues/new"]')
  end

end
