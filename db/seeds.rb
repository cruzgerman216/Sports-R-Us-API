# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


x = 0
while x < 10
    num_paragraphs = Random.new.rand(0...10)
    random = Random.new.rand(0...9)

    u = User.create(
        username: Faker::Internet.username,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name ,
        email: Faker::Internet.email,
        password: "password",
        city: "Van Buren",
        state: "Arkansas",
        birth_year: 1995,
        birth_day: 26,
        about_me: Faker::Lorem.paragraphs(number:num_paragraphs).join(" ")
    )
    x+=1
end