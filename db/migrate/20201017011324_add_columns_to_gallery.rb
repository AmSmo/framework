class AddColumnsToGallery < ActiveRecord::Migration[6.0]
  def change
    add_column :galleries, :theme, :string
    add_column :galleries, :description, :string
  end
end
