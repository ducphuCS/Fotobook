class RemoveLastLoginAndAddAvatarToUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :last_login, :datetime
    add_column :users, :avatar, :text
  end
end
