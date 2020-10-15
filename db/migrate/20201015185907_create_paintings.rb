class CreatePaintings < ActiveRecord::Migration[6.0]
  def change
    create_table :paintings do |t|
      t.string :blurb
      t.string :artist
      t.string :museum_location
      t.string :period
      t.string :image_location
      t.string :style

      t.timestamps
    end
  end
end
