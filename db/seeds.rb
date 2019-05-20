User.destroy_all
Event.destroy_all

10.times do
  user = User.new(email: Faker::Internet.unique.email, password: "password")
  user.save!
end

5.times do
  event = Event.new(
    location: Faker::Movies::HitchhikersGuideToTheGalaxy.location,
    description: Faker::TvShows::BojackHorseman.tongue_twister,
    game: Faker::Books::Lovecraft.tome,
    user: User.all.sample
    )
  event.save!
end
