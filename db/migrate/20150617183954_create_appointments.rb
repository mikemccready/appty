class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :provider_id
      t.integer :user_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.boolean :availability

      t.timestamps null: false
    end
  end
end
