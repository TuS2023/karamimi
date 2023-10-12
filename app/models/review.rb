class Review < ApplicationRecord
  belongs_to :user
  has_many :categories, through: :article_categories
  has_many :review_categories, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  
  validates :title, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :store_name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :score, presence: true
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
