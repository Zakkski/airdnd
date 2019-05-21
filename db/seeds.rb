Event.destroy_all
Profile.destroy_all
User.destroy_all


u = User.create(email: "user@email.com", password: "password")
p = Profile.new(first_name: "User", last_name: "Person")
p.remote_photo_url = "https://picsum.photos/"
p.user = u
p.save!

10.times do
  user = User.new(email: Faker::Internet.unique.email, password: "password")
  user.save!
  profile = Profile.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name)
  profile.remote_photo_url = "https://picsum.photos/"
  profile.user = user
  profile.save!
end

5.times do
  event = Event.new(
    location: Faker::Movies::HitchhikersGuideToTheGalaxy.location,
    description: Faker::TvShows::BojackHorseman.tongue_twister,
    game: Faker::Books::Lovecraft.tome,
    user: User.all.sample,
    date: "19900505",
    )
  event.save!
end
