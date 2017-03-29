class AddPendingAndBanToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pending_approval, :boolean
    add_column :users, :ban_user,         :boolean, null: false, default: false
  end
end
