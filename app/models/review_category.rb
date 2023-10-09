class ReviewCategory < ApplicationRecord
  belongs_to :review
  belongs_to :category
  validates :review_id,presence:true
  validates :category_id,presence:true
end
