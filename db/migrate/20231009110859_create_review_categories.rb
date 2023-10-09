class CreateReviewCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :review_categories do |t|
      t.integer :review_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
