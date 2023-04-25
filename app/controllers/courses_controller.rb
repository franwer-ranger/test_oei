class CoursesController < ApplicationController 
  def index
    @courses = Course.all
    render json: @courses.group_by(&:start_date).map{|date, courses| {date: date, courses: courses.map(&:name)}}
  end
end