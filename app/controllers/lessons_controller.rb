class LessonsController < ApplicationController
  def index
    @user = current_user
    @course = Course.find(params[:course_id])
    @lessons = Lesson.where(course_id: @course.id)

    @absences = Absence.all
    @rattrapages = Rattrapage.all
  end

  def new
    @available_dates = []
    @lessons = Lesson.where.not(course_id: current_user.course_id)
    @lessons.each do |lesson|
      if (Rattrapage.where(lesson_id: lesson.id) == []) && (Absence.where(lesson_id: lesson.id) != []) && (Course.find(lesson.course_id).level == Course.find(current_user.course_id).level)
        @available_dates << lesson.occurs_on
      end
    end
    @available_dates_string = @available_dates.map { |d| d.strftime("%Y-%m-%d %H:%M:%S %z") }
    @lesson = Lesson.new
  end

  def create
    @occurs_on = params[:lesson][:occurs_on]
    @current_lessons = Lesson.where("DATE_TRUNC('day', occurs_on) = ?", @occurs_on.to_date)
    session[:current_lessons_ids] = @current_lessons.pluck(:id)
    redirect_to rattrapages_new_path
  end
end
