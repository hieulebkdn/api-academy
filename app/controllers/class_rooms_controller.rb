class ClassRoomsController < ApplicationController
  before_action :set_class_room, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request

  # GET /class_rooms
  # GET /class_rooms.json
  def index
    @class_rooms = ClassRoom.all.select(:id, :name)
    render json: @class_rooms
  end

  # GET /class_rooms/1
  # GET /class_rooms/1.json
  def show
    listStudentIDs = ClassRoomUser.get_list_student_ids(@class_room.id).pluck :user_id
    listTeacherIDs = ClassRoomUser.get_list_teacher_ids(@class_room.id).pluck :user_id
    listTimetableIDs = ClassRoomTimetable.get_list_timetable(@class_room.id).pluck :timetable_id
    render json: {
      id: @class_room.id,
      name: @class_room.name,
      course_id: @class_room.course_id,
      listStudentIDs: listStudentIDs,
      listTeacherIDs: listTeacherIDs,
      listTimetableIDs: listTimetableIDs
    }
  end

  # POST /class_rooms
  # POST /class_rooms.json
  def create
    @class_room = ClassRoom.new(class_room_params)

    if @class_room.save
      render :show, status: :created
    else
      render json: @class_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /class_rooms/1
  # PATCH/PUT /class_rooms/1.json
  def update
    if @class_room.update(class_room_params)
      render :show, status: :ok
    else
      render json: @class_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /class_rooms/1
  # DELETE /class_rooms/1.json
  def destroy
    ClassRoomTimetable.where(timetable_id: @class_room.id).delete_all
    ClassRoomUser.where(class_room_id: @class_room.id).delete_all
    @class_room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_room
      @class_room = ClassRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_room_params
      params.require(:class_room).permit(:name, :course_id)
    end
end
