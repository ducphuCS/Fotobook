class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.text :source
      t.boolean :public, default: true
      t.timestamps
    end
  end
end
