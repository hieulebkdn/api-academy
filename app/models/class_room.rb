class ClassRoom < ApplicationRecord
  has_many :class_room_user, dependent: :destroy
  has_many :class_room_timetable, dependent: :destroy
  belongs_to :courses, optional: true

  scope :get_in_list, ->(list_id){where "id IN (?)",list_id }
  scope :get_not_in_list, ->(list_id){where "id NOT IN (?)",list_id }
end
