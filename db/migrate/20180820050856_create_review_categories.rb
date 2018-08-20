class CreateReviewCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :review_categories do |t|
      t.integer :review_id
      t.integer :category_id
      t.timestamps
    end
    add_index :review_categories, :review_id
    add_index :review_categories, :category_id
    add_index :review_categories, [ :review_id, :category_id ], unique: true
  end
end
