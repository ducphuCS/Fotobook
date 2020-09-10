class DropColumnSourceInPhotoAndAlbum < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :source, :text
    remove_column :albums, :source, :text
  end
end
