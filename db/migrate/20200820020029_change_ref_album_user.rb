class ChangeRefAlbumUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :albums, :users, foreign_key: true
  end
end
