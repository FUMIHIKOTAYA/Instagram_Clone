class RenameUserImageColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_image, :image 
  end
end
