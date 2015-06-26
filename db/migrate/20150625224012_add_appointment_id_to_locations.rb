class AddAppointmentIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :appointment_id, :integer
  end
end
