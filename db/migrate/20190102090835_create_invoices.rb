class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :target_name
      t.string :type
      t.text :naiyou
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
