user = User.create(name: 'hakjae', password: '1234512345', password_confirmation: '1234512345', introduction: 'りょはっちぇです',
                   external_blog_url: 'https://hakjae@example.com')
10.times do
  post = user.posts.create(body: Faker::Lorem.paragraph_by_chars(number: rand(10..140)))
  2.times do
    post.comments.create(body: Faker::Lorem.paragraph_by_chars(number: rand(10..140)))
  end
end
