class AddLastLoginToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.datetime :last_login
    end
  end
end
