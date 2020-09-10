class DropPhotoAlbumTableAndAddDefaultForLikeCache < ActiveRecord::Migration[6.0]
  def change
    drop_table :albums_photos
    add_column :photos, :album_id, :bigint
    change_column :photos, :likes_count, :integer, default: 0
    change_column :albums, :likes_count, :integer, default: 0
  end
end
