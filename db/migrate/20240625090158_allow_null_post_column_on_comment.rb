class AllowNullPostColumnOnComment < ActiveRecord::Migration[7.1]
  def change
    change_column_null :comments, :post_id, true
  end
end
