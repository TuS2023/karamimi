class User < ApplicationRecord

  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable#, :validatable ゲストログイン時バリデーションエラー発生のため

  has_one_attached :image

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join,
      user.name = "ゲスト"
    end
  end
end
