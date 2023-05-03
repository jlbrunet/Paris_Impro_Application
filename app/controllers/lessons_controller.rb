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
    Lesson.where(course_id: current_user.course_id).each do |lesson|
      @available_dates << lesson.occurs_on
    end
    @available_dates_string = @available_dates.map { |d| d.strftime("%Y-%m-%d %H:%M:%S %z") }
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.course_id = current_user.course_id
    if @lesson.save
      @absence = Absence.new(user_id: current_user.id, lesson_id: Lesson.last.id)
      @absence.save
      Lesson.last.destroy
      redirect_to root_path
    else
      render 'lessons/new', status: :unprocessable_entity
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:course_id, :occurs_on)
  end
end
