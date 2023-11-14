class RattrapagesController < ApplicationController
  def new
    if current_user.status == "teacher" || current_user.status == "admin"
      redirect_to courses_path
    else
      redirect_to root_path if Rattrapage.where(user: current_user).count >= 9
      @rattrapage_lessons = Lesson.where(id: session[:available_lessons_ids])
      @lesson = Lesson.new
    end
  end

  def create
    occurs_on = params[:lesson][:occurs_on]
    course_id = params[:lesson][:course_id].to_i
    lesson = Lesson.where("DATE_TRUNC('day', occurs_on) = ?", occurs_on.to_date).find_by(course_id: course_id)
    rattrapage = Rattrapage.new(user_id: current_user.id, lesson_id: lesson.id)
    rattrapage.save
    redirect_to rattrapage_show_path(rattrapage)
  end

  def show
    if current_user.status == "teacher" || current_user.status == "admin"
      redirect_to courses_path
    else
      rattrapage = Rattrapage.find(params[:id])
      @lesson = Lesson.find(rattrapage.lesson_id)
    end
  end

  def destroy
    @rattrapage = Rattrapage.find(params[:id])
    @lesson = Lesson.find(@rattrapage.lesson_id)
    @course = Course.find(@lesson.course_id)
    @rattrapage.destroy
    redirect_to course_lessons_path(@course)
  end
end
