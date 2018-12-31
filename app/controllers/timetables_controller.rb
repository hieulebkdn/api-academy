class TimetablesController < ApplicationController
  skip_before_action :authenticate_request
  def index
    @timetables = Timetable.all.select(:id,:weekday, :start_time, :end_time)
    render json: @timetables
  end
end
