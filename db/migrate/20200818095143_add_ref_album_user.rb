class AddRefAlbumUser < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :user_id, :bigint
    add_foreign_key :albums, :users
  end
end
