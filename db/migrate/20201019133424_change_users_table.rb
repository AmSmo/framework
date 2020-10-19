class ChangeUsersTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :paintings, :image_location, :image
    rename_column :paintings, :period, :dated
    add_column :paintings, :title, :string
    add_column :paintings, :division, :string
    
    add_column :paintings, :ham_id, :integer
  end
end
