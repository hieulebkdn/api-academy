class AddInvoiceName < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :name, :string 
  end
end
