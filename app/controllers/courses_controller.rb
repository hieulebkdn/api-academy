class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all.select(:id, :name, :duration, :fee)
    render json:  {tableData: {
      header: ["ID", "Tên khóa học", "Thời gian","Học phí"], 
      data: @courses
    }}
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course_js = Course.where(id: params[:id]).select(:id, :name, :fee, :duration)
    @course_classroom = @course.class_rooms.select(:id, :name)
    render json: {courseData: @course_js, courseClass: @course_classroom}
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    if @course.save
      render :show, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    if params[:list_class_ids]
      list_new_class_ids = params[:list_class_ids]
      ActiveRecord::Base.transaction do
        ClassRoom.where(course_id: @course.id).update_all(course_id: nil)  
        ClassRoom.get_in_list(list_new_class_ids).update_all(course_id: @course.id)
      end
    end
    if @course.update(course_params)
      render :show, status: :ok
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
  end

  def edit_class_rooms
    @course = Course.find params[:id]
    list_new_class_ids = params[:list_class_ids]
    ActiveRecord::Base.transaction do
      ClassRoom.where(course_id: @course.id).update_all(course_id: nil)  
      ClassRoom.get_in_list(list_new_class_ids).update_all(course_id: @course.id)
      @new_courses_class = ClassRoom.where(course_id: @course.id)
      render json: @new_courses_class, status: :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.permit(:name, :fee, :duration)
    end
end
