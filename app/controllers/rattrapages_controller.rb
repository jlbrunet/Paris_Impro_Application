class RattrapagesController < ApplicationController
  def new
    @rattrapage_lessons = Lesson.where(id: session[:current_lessons_ids])
    @lesson = Lesson.new
  end

  def create
    @occurs_on = params[:lesson][:occurs_on]
    @current_lesson = Lesson.where("DATE_TRUNC('day', occurs_on) = ?", @occurs_on.to_date)[0]
    @rattrapage = Rattrapage.new(user_id: current_user.id, lesson_id: @current_lesson.id)
    @rattrapage.save
    redirect_to rattrapage_show_path(@rattrapage)
  end

  def show
    @rattrapage = Rattrapage.find(params[:id])
    @lesson = Lesson.find(@rattrapage.lesson_id)
  end

  def destroy
    @rattrapage = Rattrapage.find(params[:id])
    @lesson = Lesson.find(@rattrapage.lesson_id)
    @course = Course.find(@lesson.course_id)
    @rattrapage.destroy
    redirect_to course_lessons_path(@course)
  end
end
