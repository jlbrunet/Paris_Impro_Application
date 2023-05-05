class RattrapagesController < ApplicationController
  def new
    @available_dates = []
    @lessons = Lesson.where.not(course_id: current_user.course_id)
    @lessons.each do |lesson|
      if (Rattrapage.where(lesson_id: lesson.id) == []) && (Absence.where(lesson_id: lesson.id) != [])
        @available_dates << lesson.occurs_on
      end
    end
    @available_dates_string = @available_dates.map { |d| d.strftime("%Y-%m-%d %H:%M:%S %z") }
    @lesson = Lesson.new
  end

  def create
    @occurs_on = params[:lesson][:occurs_on]
    @current_lessons = Lesson.where("DATE_TRUNC('day', occurs_on) = ?", @occurs_on.to_date)
    redirect_to rattrapage_validation_path(current_lessons: @current_lessons.to_json)
  end

  def validation
    @rattrapage_lessons = JSON.parse(params[:current_lessons])
  end

  def creation
  end

  def show
  end
end
