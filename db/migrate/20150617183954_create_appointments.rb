class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :provider_id
      t.integer :user_id
      t.string :start_time
      t.string :end_time
      t.string :location
      t.boolean :availability

      t.timestamps null: false
    end
  end
end
