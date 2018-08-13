class CreateCosmetics < ActiveRecord::Migration[5.2]
  def change
    create_table :cosmetics do |t|
      t.string :title
      t.text :image_url
      t.text :cosmetics_url
      t.timestamps
    end
  end
end
