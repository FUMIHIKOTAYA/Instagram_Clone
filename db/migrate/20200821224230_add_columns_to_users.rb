class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :text
    add_column :users, :user_image, :string
  end
end
