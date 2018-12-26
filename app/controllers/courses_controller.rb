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
      render :show, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    if @course.update(course_params)
      render :show, status: :ok, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :level, :start_date, :fee)
    end
end
