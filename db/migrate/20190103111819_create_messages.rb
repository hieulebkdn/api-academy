class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :note
      t.boolean :checked, default: true

      t.timestamps
    end
  end
end
