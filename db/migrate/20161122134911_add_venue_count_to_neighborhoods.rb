class AddVenueCountToNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    add_column :neighborhoods, :venues_count, :integer
  end
end
