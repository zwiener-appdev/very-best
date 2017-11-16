class AddBookmarkCountToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :bookmarks_count, :integer
  end
end
