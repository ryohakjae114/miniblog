10.times do
  sentence = Faker::Lorem.paragraph(sentence_count: 7)
  sentence = Faker::Lorem.paragraph(sentence_count: 7) while sentence.length > 140
  Post.create(body: sentence)
end
