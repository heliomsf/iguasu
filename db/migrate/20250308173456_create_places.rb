class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.text :name, null: false
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
  end
end
