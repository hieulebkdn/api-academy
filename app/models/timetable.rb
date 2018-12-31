class Timetable < ApplicationRecord
  has_many :class_room_timetable, dependent: :destroy

  scope :get_in_list, ->(list_timetable){where "id IN (?)",list_timetable}
end
