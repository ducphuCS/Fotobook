class RemoveForeignKeyAlbum < ActiveRecord::Migration[6.0]
  def change
    change_table :albums do |t|
      t.remove_foreign_key :users
    end
  end
end
