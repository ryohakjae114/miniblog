Dekiru::DataMigrationOperator.execute('reset_post_likes_counter') do
  posts = Post.all

  log "all targets count: #{posts.count}"
  find_each_with_progress(posts) do |post|
    Post.reset_counters(post.id, :likes)
  end
end
