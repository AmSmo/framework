class CreateGalleryPaintings < ActiveRecord::Migration[6.0]
  def change
    create_table :gallery_paintings do |t|
      t.belongs_to :gallery, null: false, foreign_key: true
      t.belongs_to :painting, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
