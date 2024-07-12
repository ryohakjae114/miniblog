user = User.create!(name: 'hakjae', password: '1234512345', password_confirmation: '1234512345', introduction: 'りょはっちぇです',
                    external_blog_url: 'https://hakjae@example.com')
11.times do |n|
  yesterday_at = Time.current - 1.day
  post = user.posts.create!(body: Faker::Lorem.paragraph_by_chars(number: rand(10..140)), created_at: yesterday_at, updated_at: yesterday_at)
  2.times do
    user.comments.create!(post:, body: Faker::Lorem.paragraph_by_chars(number: rand(10..140)))
  end
  unless n == 10
    user.likes.create!(post:)
  end
end
