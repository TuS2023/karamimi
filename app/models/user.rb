class User < ApplicationRecord

  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#ユーザーのプロフィール画像はひとつだけ持たせる
  has_one_attached :profile_image

#ゲストユーザーをクリエイトと同時にパスワードをランダムに生成させる。メールアドレスと名前は指定
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join,
      user.name = "ゲスト"
    end
  end
#プロフィール画像がなければno_image.jpgを渡す
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

#ユーザーの会員ステータスを確認し条件指定で処理
  def active_for_authentication?
    super && (is_active == true)
  end

end
