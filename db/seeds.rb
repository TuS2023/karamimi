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
  review.user_id = 1
  review.title = "唐辛子たっぷりトマトパスタ"
  review.address = "静岡県浜松市"
  review.score = 3
  review.price = 1000
end
Review.find_or_create_by!(store_name: "四川料理　辛") do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  review.explanation = "熱々で食べる激辛ビビンバです。"
  review.user_id = 2
  review.title = "激辛ビビンバ"
  review.address = "静岡県静岡市"
  review.score = 5
  review.price = 2000
end
Review.find_or_create_by!(store_name: "居酒屋　汗汗") do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  review.explanation = "ほどよい酸味の効いたウマ辛キムチです。"
  review.user_id = 3
  review.title = "ウマ辛キムチ"
  review.address = "静岡県掛川市"
  review.score = 2
  review.price = 800
end