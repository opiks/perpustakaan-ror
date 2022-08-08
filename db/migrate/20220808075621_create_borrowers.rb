class CreateBorrowers < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowers do |t|
      t.integer :book_id, null: false
      t.integer :member_id, null: false
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
