class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :category, :string
    add_column :users, :sign_ins, :integer
  end
end
