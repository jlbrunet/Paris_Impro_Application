class CoursesController < ApplicationController
  def index
    current_user.status == "student" ? (redirect_to root_path) : (@courses = Course.all)
  end

  def show
    if current_user.status == "student"
      redirect_to root_path
    else
      @course = Course.find(params[:id])
      @students = User.where(course_id: @course.id, status: "student").sort_by(&:last_name).map do |student|
        student.last_name = student.last_name.upcase
        student
      end
    end
  end
end
