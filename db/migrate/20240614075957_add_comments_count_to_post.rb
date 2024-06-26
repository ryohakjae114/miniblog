class AddCommentsCountToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :comments_count, :integer, default: 0
  end
end
