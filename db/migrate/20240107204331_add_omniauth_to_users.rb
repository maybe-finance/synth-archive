class AddOmniauthToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :github_image, :string
    add_column :users, :github_username, :string
    add_column :users, :x_username, :string
  end
end
