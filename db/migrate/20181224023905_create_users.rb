class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :phone, null: false
      t.integer :role, null: false, default: "student"

      t.timestamps
    end
  end
end
