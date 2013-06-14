class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.datetime :appointment_start_time
      t.integer :duration
      t.datetime :appointment_end_time
      t.boolean :closed
      t.text :comment

      t.timestamps
    end
  end
end
