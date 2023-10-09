class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :explanation, null: false
      t.string :store_name, null: false
      t.string :address, null: false
      t.string :score, null: false
      t.string :price, null: false

      t.timestamps
    end
  end
end
