class CreatePhoto < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.text :img
      t.boolean :public, default: true
    end
  end
end
