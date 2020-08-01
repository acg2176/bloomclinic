class AddColumnAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :concern, :string
  end
end
