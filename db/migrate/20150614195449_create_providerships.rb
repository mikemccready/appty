class CreateProviderships < ActiveRecord::Migration
  def change
    create_table :providerships do |t|
      t.integer :user_id
      t.integer :provider_id

      t.timestamps null: false
    end
  end
end
