# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "admin@admin.com", password: "adminpass")

man1 = User.find_or_create_by!(email: "man1@example.com") do |user|
  user.name = "man1"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")
end
man2 = User.find_or_create_by!(email: "man2@example.com") do |user|
  user.name = "man2"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
end

man3 = User.find_or_create_by!(email: "man3@example.com") do |user|
  user.name = "man3"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")
end

Review.find_or_create_by!(store_name: "イタリアン辛い") do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  review.explanation = "激辛トマトパスタです。"
  review.user = man1
  review.title = "唐辛子たっぷりトマトパスタ"
  review.address = "静岡県浜松市"
  review.score = 3
  review.price = 900
  category_names = ["クーポン利用可", "期間限定"]
  category_names.each do |name|
    category = Category.find_or_create_by!(category_name: name)
    review.categories << category
  end
end
Review.find_or_create_by!(store_name: "四川料理　辛") do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  review.explanation = "熱々で食べる激辛ビビンバです。"
  review.user = man2
  review.title = "激辛ビビンバ"
  review.address = "静岡県静岡市"
  review.score = 5
  review.price = 1100
  category_names = ["予約可能" , "罰金あり", "誓約書あり", "唐辛子"]
  category_names.each do |name|
    category = Category.find_or_create_by!(category_name: name)
    review.categories << category
  end
end
Review.find_or_create_by!(store_name: "居酒屋　汗汗") do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  review.explanation = "ほどよい酸味の効いたウマ辛キムチです。"
  review.user = man3
  review.title = "ウマ辛キムチ"
  review.address = "静岡県掛川市"
  review.score = 2
  review.price = 800
  review.categories << Category.find_or_create_by!(category_name: "持ち帰り可")
end

Review.find_or_create_by!(store_name: "らぁめん辛") do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg")
  review.explanation = "やみつきになるピリ辛担々麺。"
  review.user = man2
  review.title = "やみつきピリ辛担々麺"
  review.address = "静岡県掛川市"
  review.score = 3
  review.price = 1000
  review.categories << Category.find_or_create_by!(category_name: "持ち帰り可")
end

Review.find_or_create_by!(store_name: "韓国料理店") do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg")
  review.explanation = "チーズが多くて熱々の状態を楽しめます。"
  review.user = man3
  review.title = "本格チーズダッカルビ"
  review.address = "静岡県浜松市"
  review.score = 3
  review.price = 2000
  review.categories << Category.find_or_create_by!(category_name: "持ち帰り可")
end

Review.find_or_create_by!(store_name: "下町料理店") do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg")
  review.explanation = "豚肉とキムチの酸味と辛味がマッチします。"
  review.user = man3
  review.title = "野菜多めのブタキムチ"
  review.address = "静岡県浜松市"
  review.score = 3
  review.price = 1200
  review.categories << Category.find_or_create_by!(category_name: "持ち帰り可")
end

Category.find_or_create_by!(category_name: "持ち帰り可")
Category.find_or_create_by!(category_name: "クーポン利用可")
Category.find_or_create_by!(category_name: "予約不可")
Category.find_or_create_by!(category_name: "予約可能")
Category.find_or_create_by!(category_name: "期間限定")
Category.find_or_create_by!(category_name: "罰金あり")
Category.find_or_create_by!(category_name: "誓約書あり")
Category.find_or_create_by!(category_name: "唐辛子")
Category.find_or_create_by!(category_name: "山椒")