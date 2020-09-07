class CreateAlbum < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.text :source
      t.boolean :public, default: true
    end
  end
end
