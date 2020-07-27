class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :therapist_id
      t.integer :patient_id
      t.date :appt_date
      t.time :appt_time
    end
  end
end
