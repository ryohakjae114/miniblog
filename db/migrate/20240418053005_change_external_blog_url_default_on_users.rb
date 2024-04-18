class ChangeExternalBlogUrlDefaultOnUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :external_blog_url, from: nil, to: ''
  end
end
