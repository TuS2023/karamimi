class Review < ApplicationRecord
  has_many :categories, through: :article_categories
  has_many :review_categories, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
