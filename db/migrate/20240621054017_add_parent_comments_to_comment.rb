class AddParentCommentsToComment < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :parent_comment_id, :integer
    add_foreign_key :comments, :comments, column: :parent_comment_id
  end
end
