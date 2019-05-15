class AddFavColumnsToArtwork < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :owner_fav, :boolean 
    add_column :artworks, :shared_fav, :boolean
  end
end
