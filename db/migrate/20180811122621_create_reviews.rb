class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :item_image
      t.string :item_name
      t.integer :user_id
      t.integer :item_id
      t.integer :favorite_id
      t.integer :comment_id
      t.timestamps
    end
  end
end
