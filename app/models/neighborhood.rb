class Neighborhood < ApplicationRecord
  # Direct associations

  has_many   :venues,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :city, :presence => true

  validates :name, :uniqueness => { :scope => [:state, :city], :message => "already exists" }

  validates :name, :presence => true

  validates :state, :presence => true

end
