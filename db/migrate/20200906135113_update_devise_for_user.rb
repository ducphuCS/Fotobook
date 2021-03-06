class UpdateDeviseForUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :email, :string, null: false, default: ""
    remove_column :users, :password, :string
    add_column :users, :encrypted_password, :string, null: false, default: ""
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    add_index :users, :email,                unique: true
    add_index :users, :confirmation_token,   unique: true
  end
end
