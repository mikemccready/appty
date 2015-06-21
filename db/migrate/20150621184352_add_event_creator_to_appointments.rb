class AddEventCreatorToAppointments < ActiveRecord::Migration
  def change
  	add_column :appointments, :event_creator, :string
  end
end
