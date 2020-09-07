class AddImageToPhoto < ActiveRecord::Migration[6.0]
  def change
    change_table :photos do |t|
      t.text :image
    end
  end
end
