class RenameProfileColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :profile, :introduction
  end
end
