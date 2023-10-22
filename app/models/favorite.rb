class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :review

  validates_uniqueness_of :review_id, scope: :user_id
end
