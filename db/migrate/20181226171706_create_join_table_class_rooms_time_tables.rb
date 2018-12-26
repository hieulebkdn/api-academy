class CreateJoinTableClassRoomsTimeTables < ActiveRecord::Migration[5.2]
  def change
    create_join_table :class_rooms, :timetables do |t|
      t.index [:class_room_id, :timetable_id]
      t.index [:timetable_id, :class_room_id]
    end
  end
end
