class Timetable < ApplicationRecord
  has_many :class_room_timetable, dependent: :destroy
end
