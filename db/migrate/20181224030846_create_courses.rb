class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :level, null: false
      t.date :start_date, null:false
      t.decimal :fee, null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
