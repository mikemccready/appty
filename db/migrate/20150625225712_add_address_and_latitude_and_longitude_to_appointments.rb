class AddAddressAndLatitudeAndLongitudeToAppointments < ActiveRecord::Migration
  def change
  	add_column :appointments, :longitude, :float
	add_column :appointments, :latitude, :float 

  end
end
