class ChangeRefPhotoUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :photos, :users, foreign_key: true
  end
end
