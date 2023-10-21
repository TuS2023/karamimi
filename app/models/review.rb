class Review < ApplicationRecord
  belongs_to :user

  has_many :review_categories, dependent: :destroy
  has_many :categories, through: :review_categories

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

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :high_score, -> {order(score: :desc)}
  scope :low_score, -> {order(score: :asc)}

  def self.search(keyword)
    where("title LIKE ?", "%#{keyword}%")
  end



  def get_review_image
    unless image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   image
 end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
