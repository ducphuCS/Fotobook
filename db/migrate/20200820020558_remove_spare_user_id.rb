class RemoveSpareUserId < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :user_id
    remove_column :albums, :user_id
  end
end
