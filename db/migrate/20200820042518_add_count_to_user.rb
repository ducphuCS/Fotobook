class AddCountToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.integer :photo_count, default: 0
      t.integer :album_count, default: 0
    end
  end
end
