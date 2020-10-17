class CreateFloorGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :floor_galleries do |t|
      t.belongs_to :floor, null: false, foreign_key: true
      t.belongs_to :gallery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
