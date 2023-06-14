class RattrapagesController < ApplicationController
  def new
    @user_c = current_user
    if @user_c.status == "teacher" || @user_c.status == "admin"
      redirect_to courses_path
    else
      @rattrapage_lessons = Lesson.where(id: session[:current_lessons_ids])
      @lesson = Lesson.new
    end
  end

  def create
    @occurs_on = params[:lesson][:occurs_on]
    @course_id = params[:lesson][:course_id].to_i
    @current_lessons = Lesson.where("DATE_TRUNC('day', occurs_on) = ?", @occurs_on.to_date)
    @current_lessons.each do |lesson|
      @current_lesson = lesson if lesson.course_id == @course_id
    end
    @rattrapage = Rattrapage.new(user_id: current_user.id, lesson_id: @current_lesson.id)
    @rattrapage.save
    redirect_to rattrapage_show_path(@rattrapage)
  end

  def show
    @user_c = current_user
    if @user_c.status == "teacher" || @user_c.status == "admin"
      redirect_to courses_path
    else
      @rattrapage = Rattrapage.find(params[:id])
      @lesson = Lesson.find(@rattrapage.lesson_id)
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
