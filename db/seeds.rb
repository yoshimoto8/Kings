# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# posts 作成

15.times {
  Review.create(cosmetics_id: 1, reviews_valuation: 1, title: "aaaa", item_comment: "aaaaa",
    user_id: 1, item_image: 'aaa', item_name: 'aaaa')
}