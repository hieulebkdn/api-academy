class ClassRoomsController < ApplicationController
  before_action :set_class_room, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request

  # GET /class_rooms
  # GET /class_rooms.json
  def index
    @class_rooms = ClassRoom.all.select(:id, :name, :course_id)
    render json: @class_rooms
  end

  # GET /class_rooms/1
  # GET /class_rooms/1.json
  def show
    listStudentIDs = ClassRoomUser.get_list_student_ids(@class_room.id).pluck :user_id
    listTeacherIDs = ClassRoomUser.get_list_teacher_ids(@class_room.id).pluck :user_id
    listTimetableIDs = ClassRoomTimetable.where(class_room_id: @class_room.id).pluck :timetable_id
    # listTimetableIDs = ClassRoomTimetable.get_list_timetable(@class_room.id).pluck :timetable_id
    listTimetable =  Timetable.get_in_list(listTimetableIDs).select(:id, :weekday, :start_time, :end_time)
    listTeacher = User.get_in_list(listTeacherIDs).select(:id, :name, :phone)
    listStudent = User.get_in_list(listStudentIDs).select(:id, :name, :phone)
    course = Course.select(:id, :name).where(id: @class_room.course_id).take
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
      add_student_to_class if params[:list_students]
      add_teacher_to_class if params[:list_teachers]
      add_timetable_to_class if params[:list_timetables]
      render json: @class_room, status: :ok
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
    ActiveRecord::Base.transaction do
      ClassRoomTimetable.where(timetable_id: @class_room.id).delete_all
      ClassRoomUser.where(class_room_id: @class_room.id).delete_all
      @class_room.destroy
    end
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

    def add_student_to_class
      @listStudentIDs = params[:list_students]
      @listStudentIDs.each do |student_id| 
        ClassRoomUser.create! user_id: student_id, class_room_id: @class_room.id
      end
    end

    def add_teacher_to_class
      @listTeacherIDs = params[:list_teachers]
      @listTeacherIDs.each do |teacher_id| 
        ClassRoomUser.create! user_id: teacher_id, class_room_id: @class_room.id, is_teacher: true
      end
    end

    def add_timetable_to_class
      @listTimetableIDs = params[:list_timetables]
      @listTimetableIDs.each do |timetable_id|
        ClassRoomTimetable.create! class_room_id: @class_room.id, timetable_id: timetable_id
      end
    end
end
