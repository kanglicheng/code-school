10.times do |i|
  u = User.create!(username: Faker::Name.name, password: "password")
  c = Cat.create!(
    user_id: u.id,
    name: Faker::Hipster.word,
    color: Cat::CAT_COLORS.sample,
    sex: ["M", "F"].sample,
    description: Faker::Hipster.sentence,
    birth_date: Faker::Date.between(10.years.ago, Date.today)
    )
end
