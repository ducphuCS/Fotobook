class DropPhotoCountInAlbum < ActiveRecord::Migration[6.0]
  def change
    remove_column :albums, :photos_count, :integer
  end
end
