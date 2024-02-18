Admin.create!(
  email: 'kame@gmail.com',
  password: 'Webcamp1374'
)

workout_tag_names = %w(短距離 中距離 長距離)
workout_tags = workout_tag_names.map do |name|
  WorkoutTag.create!(name: name)
end

prefecture_names = %w(
  北海道
  青森県
  岩手県
  宮城県
  秋田県
  山形県
  福島県
  茨城県
  栃木県
  群馬県
  埼玉県
  千葉県
  東京都
  神奈川県
  新潟県
  富山県
  石川県
  福井県
  山梨県
  長野県
  岐阜県
  静岡県
  愛知県
  三重県
  滋賀県
  京都府
  大阪府
  兵庫県
  奈良県
  和歌山県
  鳥取県
  島根県
  岡山県
  広島県
  山口県
  徳島県
  香川県
  愛媛県
  高知県
  福岡県
  佐賀県
  長崎県
  熊本県
  大分県
  宮崎県
  鹿児島県
  沖縄県
)

prefectures = prefecture_names.map do |name|
  Prefecture.create!(name: name)
end

if Rails.env.development?
  (1..10).each do |n|
    user = User.create!(email: "test#{n}@test.com",
                 password: "password",
                 last_name: "test#{n}",
                 first_name: "name#{n}",
                 last_name_kana: "test#{n}",
                 first_name_kana: "name#{n}")
    (0..rand(0..3)).each do |i|
      user.posts.create!(titlename: "title#{n}_#{i}", postcontent: "xxxxx" * rand(1..5), prefecture_id: prefectures.sample.id, workout_tag_id: workout_tags.sample.id)
    end
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
