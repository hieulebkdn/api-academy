class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.date :dob
      t.boolean :gender
      t.string :adress
      t.string :parent_name
      t.string :parent_phone

      t.timestamps
    end
    add_reference :accounts, :user, foreign_key: true
  end
end
