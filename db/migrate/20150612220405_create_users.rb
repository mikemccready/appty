class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_namelast_name
      t.string :email
      t.string :phone_number
      t.string :image
      t.string :password_digest
      t.boolean :provider

      t.timestamps null: false
    end
  end
end
