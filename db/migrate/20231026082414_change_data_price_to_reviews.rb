class ChangeDataPriceToReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :price, :integer
  end
end
