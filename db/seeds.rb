taji = User.create(name: 'taji', password: '1234512345', password_confirmation: '1234512345', introduction: 'tajiです',
                   external_blog_url: 'https://taji@example.com')
hakjae = User.create(name: 'hakjae', password: '1234512345', password_confirmation: '1234512345', introduction: 'りょはっちぇです',
                     external_blog_url: 'https://hakjae@example.com')
5.times do
  post = hakjae.posts.create!(body: Faker::Lorem.paragraph_by_chars(number: rand(10..140)))
  2.times do
    comment = taji.comments.create!(post:, body: Faker::Lorem.paragraph_by_chars(number: rand(10..140)))
    comment.child_comments.create!(body: Faker::Lorem.paragraph_by_chars(number: rand(10..140)), user: hakjae, post_id: comment.post_id)
  end
end
