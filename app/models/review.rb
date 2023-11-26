class Review < ApplicationRecord
  belongs_to :user

  has_many :review_categories, dependent: :destroy
  has_many :categories, through: :review_categories

  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #もたせる画像はひとつ
  has_one_attached :image

  validates :title, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :store_name, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}

  validates :score, presence: true

#絞り込み機能で条件指定
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :high_score, -> {order(score: :desc)}
  scope :low_score, -> {order(score: :asc)}

#タイトルに対してキーワード検索できるよう条件指定
  def self.search(keyword)
    where("title LIKE ?", "%#{keyword}%")
  end


#レビューのイメージが存在していないならno_image.jpgを渡す
  def get_review_image
    unless image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   image
 end
#指定されたユーザが特定の投稿をいいねしているかどうかを判定します。
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
