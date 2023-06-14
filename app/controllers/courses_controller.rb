class CoursesController < ApplicationController
  def index
    @user_c = current_user
    if @user_c.status == "student"
      redirect_to root_path
    else
      @user = current_user
      @courses = Course.all
    end
  end

  def show
    @user_c = current_user
    if @user_c.status == "student"
      redirect_to root_path
    else
      @user = current_user
      @course = Course.find(params[:id])
      @students = User.where(course_id: @course.id, status: "student")
    end
  end
end
