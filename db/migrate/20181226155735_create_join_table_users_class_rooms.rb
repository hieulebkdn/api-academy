class CreateJoinTableUsersClassRooms < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :class_rooms do |t|
      t.index [:user_id, :class_room_id]
      t.index [:class_room_id, :user_id]
      t.boolean :is_teacher, default: false
    end
  end
end
