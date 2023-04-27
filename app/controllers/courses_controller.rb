class CoursesController < ApplicationController 
  def index
    @courses = Course.all
    @filtered_courses = Courses::Service.new(@courses).filter(params[:editions], params[:criteria])
    render json: @filtered_courses.group_by(&:start_date).map{|date, courses| {date: date, courses: courses.map(&:name)}}
  end
end