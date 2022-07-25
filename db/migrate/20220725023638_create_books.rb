class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer :location_id, null: false
      t.integer :type_id, null: false
      t.text :name, null: false
      t.text :description, null: false
      t.date :release_date, null: false
      t.integer :page_total, null: false
      t.text :publisher, null: false
      t.text :writer, null: false
      t.text :book_photo, null: false
      t.integer :book_total, null: false
      t.integer :book_total_remaining, null: false
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
