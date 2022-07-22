class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :nik, null: false
      t.text :name, null: false
      t.string :email, null: false, index: { unique: true, name: "unique_emails" }
      t.string :phone
      t.text :place_birth
      t.date :date_birth
      t.string :blood_type
      t.string :gender
      t.string :religion
      t.text :photo
      t.text :photo_path
      t.text :address
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
