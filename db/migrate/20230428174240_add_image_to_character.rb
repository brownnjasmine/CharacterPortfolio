class AddImageToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :image_data, :text
  end
end
