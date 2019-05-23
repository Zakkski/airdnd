Booking.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all

img_array = ["stone_gszij2", "beast_q1zm9g", "green_nhtvia", "snow_u7avxm", "drag_fsgr1q", "rock_wnbh0s",
                 "spider_ueutid", "sea_iweyjv", "sea2_g9fu1p", "power_lzg5by", "drag2_mll4uf",
                 "drag3_ewgrag", "demon_qvpjzt", "horror_ayjvoq"]

games = ["Magic The Gathering",
             "Dungeons and Dragons",
             "Warhammer 40K",
             "Risk",
             "World of Darkness",
             "Settlers of Catan",
             "Cards Against Humanity",
             "Group Board Game",
             "Modern Game",
             "Fantasy Game"]

u = User.create(email: "user@email.com", password: "password")
p = Profile.new(first_name: "User", last_name: "Person")
p.remote_photo_url = "https://picsum.photos/300/300"
p.user = u
p.save!
puts "create user@email.com"

5.times do
  user = User.new(email: Faker::Internet.unique.email, password: "password")
  user.save!
  profile = Profile.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name)
  profile.remote_photo_url = "https://picsum.photos/300/300"
  profile.user = user
  profile.save!
end

puts "create Users"

8.times do
  event = Event.new(
    location: Faker::Movies::HitchhikersGuideToTheGalaxy.location,
    description: Faker::TvShows::BojackHorseman.tongue_twister,
    game: games.sample,
    user: User.all.sample,
    date: "19900505",
    photo: img_array.sample,
    )
  event.save!
end

puts "create Events"
