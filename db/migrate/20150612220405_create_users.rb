class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :phone_number
      t.string :image_url
      t.string :url
      t.string :uid
      t.string :provider
      t.boolean :is_provider

      t.timestamps null: false
    end
  end
end
