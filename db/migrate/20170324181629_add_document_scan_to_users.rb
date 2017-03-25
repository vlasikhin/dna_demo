class AddDocumentScanToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :document_scan, :string
  end
end
