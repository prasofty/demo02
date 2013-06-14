class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :location
      t.text :about_me
      t.attachment :picture

      t.timestamps
    end
  end
end
