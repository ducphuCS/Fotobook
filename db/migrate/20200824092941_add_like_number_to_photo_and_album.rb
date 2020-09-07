class AddLikeNumberToPhotoAndAlbum < ActiveRecord::Migration[6.0]
  def change
    create_table :photo_likes, :id => false  do |t|
      t.belongs_to :user
      t.belongs_to :photo
    end
    create_table :album_likes, :id => false do |t|
      t.belongs_to :user
      t.belongs_to :album
    end
  end
end
