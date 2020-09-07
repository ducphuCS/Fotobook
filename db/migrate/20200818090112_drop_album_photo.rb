class DropAlbumPhoto < ActiveRecord::Migration[6.0]
  def change
    drop_table :albums
    drop_table :photos
  end
end
