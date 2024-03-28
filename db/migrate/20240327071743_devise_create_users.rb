# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :name, null: false, limit: 20
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.string :profile, limit: 200
      t.text :external_blog_url, limit: 2083

      t.timestamps null: false
    end

    add_index :users, :name,                 unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
