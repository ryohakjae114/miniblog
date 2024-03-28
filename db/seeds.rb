user = User.create(name: 'hakjae', password: '12341234', password_confirmation: '12341234', profile: 'りょはっちぇです',
                   external_blog_url: 'hakjae_blog@example.com')
10.times do
  user.posts.create(body: Faker::Lorem.paragraph_by_chars(number: rand(10..140)))
end
