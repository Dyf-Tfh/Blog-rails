# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do |index|
  Category.create(name: "Category#{index}")
end

10.times do
  new_user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
  wooof = Article.create(
    title: Faker::Book.title,
    content: Faker::ChuckNorris.fact,
    user_id: new_user.id,
    # .order("RANDOM()").firs.id renvoit l'id d'un élément de la table
    # Je vais l'utiliser très souvent :P
    category_id: Category.order("RANDOM()").first.id
  )
end
15.times do
  Comment.create(
    content: Faker::GreekPhilosophers.quote,
    user_id: User.order("RANDOM()").first.id,
    article_id: Article.order("RANDOM()").first.id
  )
end
15.times do
  Like.create(
    user_id: User.order("RANDOM()").first.id,
    article_id: Article.order("RANDOM()").first.id
  )
end
