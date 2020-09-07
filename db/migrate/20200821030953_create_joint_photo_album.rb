class CreateJointPhotoAlbum < ActiveRecord::Migration[6.0]
  def change
    create_table :albums_photos, :id => false do |t|
      t.belongs_to :photo
      t.belongs_to :album
    end
    change_table :albums do |t|
      t.integer :photos_count
    end
  end
end
