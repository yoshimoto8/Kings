class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :item_image, null: false
      t.string :item_name
      t.string :title
      t.string :review_image
      t.text :item_comment, null: false
      t.integer :reviews_valuation
      t.integer :cosmetic_id
      t.integer :user_id
      t.integer :favorite_id
      t.integer :comment_id
      t.timestamps
    end
  end
end
