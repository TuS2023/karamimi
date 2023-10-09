class Category < ApplicationRecord
  validates :name,presence:true,length:{maximum:50}
  has_many :articles, through: :review_categories
  has_many :review_categories, dependent: :destroy
end
