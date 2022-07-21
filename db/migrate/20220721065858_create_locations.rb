class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
