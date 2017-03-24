class AddRegistrationInfoForUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name,         :string
    add_column :users, :surname,      :string
    add_column :users, :patronymic,   :string
    add_column :users, :phone_number, :string
    add_column :users, :city,         :string
    add_column :users, :address,      :string
  end
end
