10.times do
  Post.create(body: Faker::Lorem.paragraph_by_chars(number: rand(10..140)))
end
