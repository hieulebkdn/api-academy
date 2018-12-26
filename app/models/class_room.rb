class ClassRoom < ApplicationRecord
  has_many :class_room_user
  has_many :class_room_timetable

  scope :get_in_list, ->(list_id){where "id IN (?)",list_id }
end
