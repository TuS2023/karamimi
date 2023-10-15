class Category < ApplicationRecord
  has_many :review_categories, dependent: :destroy
  has_many :reviews, through: :review_categories

  validates :category_name, presence: true
end
