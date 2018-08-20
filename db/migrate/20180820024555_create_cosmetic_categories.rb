class CreateCosmeticCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :cosmetic_categories do |t|
      t.integer :cosmetic_id
      t.integer :category_id
      t.timestamps
      t.timestamps
    end
    add_index :cosmetic_categories, :cosmetic_id
    add_index :cosmetic_categories, :category_id
    add_index :cosmetic_categories, [ :cosmetic_id, :category_id ], unique: true
  end
end
