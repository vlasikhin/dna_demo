class AddSocialNetworkFlagToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :social_network, :boolean, null: false, default: false
  end
end
