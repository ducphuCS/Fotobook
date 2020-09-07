class RepairReference < ActiveRecord::Migration[6.0]
  def change
    remove_reference :photos, :users, index: true, foreign_key: true
    remove_reference :albums, :users, index: true, foreign_key: true
    add_reference :photos, :user, foreign_key: true
    add_reference :albums, :user, foreign_key: true
  end
end
