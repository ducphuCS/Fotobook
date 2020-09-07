class RenameImgInPhoto < ActiveRecord::Migration[6.0]
  def change
    change_table :photos do |t|
      t.rename :img, :source
    end
  end
end
