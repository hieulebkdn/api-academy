class Course < ApplicationRecord
  has_many :class_rooms, dependent: :destroy
  
end
