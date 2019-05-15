# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
    User.create(username: Faker::Name.name)
end

10.times do |n|
    n+=1
    Artwork.create(title: Faker::Hipster.sentence, image_url: Faker::Internet.domain_name, artist_id: n)
end

10.times do |n|
    n+=1
    ArtworkShare.create(artwork_id: n, viewer_id: n)
end

10.times do |n|
    n+=1
    Comment.create(artwork_id: n, user_id: n, body: Faker::Movies::HitchhikersGuideToTheGalaxy.quote)
end