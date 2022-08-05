class CreateBookCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :book_categories do |t|
      t.integer :book_id, null: false
      t.integer :genre_id, null: false
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
