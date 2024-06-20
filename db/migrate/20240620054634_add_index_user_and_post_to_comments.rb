class AddIndexUserAndPostToComments < ActiveRecord::Migration[7.1]
  def change
    add_index :comments, %i[user_id post_id]
  end
end
