class AddNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstname, :string, limit:25
    add_column :users, :lastname, :string, limit:25
  end
end
