class CreateTimetables < ActiveRecord::Migration[5.2]
  def change
    create_table :timetables do |t|
      t.string :weekday
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
    add_reference :users, :timetable, foreign_key: true
  end
end
