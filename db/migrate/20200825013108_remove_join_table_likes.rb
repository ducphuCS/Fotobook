class RemoveJoinTableLikes < ActiveRecord::Migration[6.0]
  def change
    drop_table :photo_likes
    drop_table :album_likes
  end
end
