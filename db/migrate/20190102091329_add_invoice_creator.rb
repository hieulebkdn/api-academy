class AddInvoiceCreator < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :admin_name, :string 
  end
end
