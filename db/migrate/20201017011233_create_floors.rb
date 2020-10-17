class CreateFloors < ActiveRecord::Migration[6.0]
  def change
    create_table :floors do |t|
      t.integer :number
      t.string :name

      t.timestamps
    end
  end
end
