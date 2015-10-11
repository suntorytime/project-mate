require "faker"

users = 15.times do
  User.create(:name=> Faker::Name.name, :password=> "password", :email=> Faker::Internet.email)
end

mates = 15.times do
  Mate.create(:first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :birthday => Faker::Date.backward(14),
    :job => Faker::Name.title,
    :city => Faker::Address.city,
    :random_note => Faker::Lorem.sentence(3),
    :motivation => "Climb Mt Everest",
    :like => Faker::Lorem.words,
    :dislike => Faker::Lorem.words,
    :travel_destination => Faker::Address.city,
    :favorite_drink => "Whiskey, neat",
    :inspiration => "Elon Musk",
    :quirk => "Eats lots of popcorn",
    :accomplishment => "Climbed Kilimanjaro",
    :ideal_day => "Eat pastries at a cafe in Austria",

    )
end
