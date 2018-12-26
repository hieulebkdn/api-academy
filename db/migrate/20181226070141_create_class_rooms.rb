class CreateClassRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :class_rooms do |t|
      t.string :name

      t.timestamps
      t.references :course, foreign_key: true
    end
  end
end
