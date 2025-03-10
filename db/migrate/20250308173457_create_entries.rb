class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.text :pdfUrl, null: false
      t.text :ref, null: false
      t.text :author
      t.text :recipient, null: false
      t.text :title
      t.integer :placeId, null: false
      t.text :placeName
      t.datetime :date1
      t.datetime :date2
      t.datetime :date3
      t.text :document
      t.text :description

      t.timestamps
    end

    add_foreign_key :entries, :places, column: :placeId, on_delete: :restrict, on_update: :cascade
  end
end
