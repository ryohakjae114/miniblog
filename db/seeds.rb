user = User.create(name: 'hakjae', password: '1234512345', password_confirmation: '1234512345', profile: 'りょはっちぇです',
                   external_blog_url: 'hakjae_blog@example.com')
10.times do
  user.posts.create(body: Faker::Lorem.paragraph_by_chars(number: rand(10..140)))
end
