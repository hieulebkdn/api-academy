class ClassRoom < ApplicationRecord
  has_many :class_room_user, dependent: :destroy
  has_many :class_room_timetable, dependent: :destroy

  scope :get_in_list, ->(list_id){where "id IN (?)",list_id }
end
