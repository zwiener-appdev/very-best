class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :dish,
             :counter_cache => true

  belongs_to :venue,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :dish_id, :presence => true

  validates :user_id, :presence => true

  validates :venue_id, :uniqueness => { :scope => [:dish_id, :user_id], :message => "has already been bookmarked" }

  validates :venue_id, :presence => true

end
