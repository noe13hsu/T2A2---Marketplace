class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string, null: false
    add_column :users, :mobile, :string
    add_column :users, :location, :string, null: false
  end
end
