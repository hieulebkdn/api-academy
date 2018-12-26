class ClassRoomTimetable < ApplicationRecord
  self.table_name = "class_rooms_timetables"

  scope :get_list_timetable, ->(class_room_id){where "class_room_id = ?",class_room_id}
  scope :get_list_class_ids, ->(timetable_id){where "timetable_id = ?",timetable_id}
end
