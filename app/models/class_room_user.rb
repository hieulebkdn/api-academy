class ClassRoomUser < ApplicationRecord
  self.table_name = "class_rooms_users"

  scope :get_list_student_ids, ->(class_room_id){where "is_teacher = false AND class_room_id = ?",class_room_id}
  scope :get_list_teacher_ids, ->(class_room_id){where "is_teacher = true AND class_room_id = ?",class_room_id}
  scope :get_list_class_ids, ->(user_id){where "user_id = ?",user_id}
end
