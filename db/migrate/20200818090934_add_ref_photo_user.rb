class AddRefPhotoUser < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :user_id, :bigint
    add_foreign_key :photos, :users
  end
end
