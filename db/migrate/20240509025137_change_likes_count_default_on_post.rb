class ChangeLikesCountDefaultOnPost < ActiveRecord::Migration[7.1]
  def change
    change_column_default :posts, :likes_count, from: nil, to: 0
    change_column_null :posts, :likes_count, false
  end
end
