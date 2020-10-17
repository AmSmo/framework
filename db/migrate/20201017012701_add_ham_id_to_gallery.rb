class AddHamIdToGallery < ActiveRecord::Migration[6.0]
  def change
    add_column :galleries, :ham_id, :integer
  end
end
