class RemoveForeignKeyPhoto < ActiveRecord::Migration[6.0]
  def change
    change_table :photos do |t|
      t.remove_foreign_key :users
    end
  end
end
