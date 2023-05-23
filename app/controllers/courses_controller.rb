class CoursesController < ApplicationController
  def index
    @user = current_user
    @courses = Course.all
  end

  def show
    @user = current_user
    @course = Course.find(params[:id])
    @students = User.where(course_id: @course.id).where.not(status: "teacher")
  end
end
