# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
   email: 'a@a',
   password: 'aaaaaa',
   name: '温泉太郎',
   address: "埼玉県"
)

# Article.create!(
#    user_id: "1",
#    spa_name: "七福の湯",
#    date: Tue, 11 Jun 2019,
#    impression: "とてもいい気持ちのお湯でした。",
#    value: 5,
#    spa_address: "東京都渋谷区",
#    latitude: 35.6645956,
#    longitude: 139.6987107,
#    deleted_at: nil,
# )
