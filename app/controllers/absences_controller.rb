class AbsencesController < ApplicationController
  def new
    @absence = Absence.new
    @lesson = Lesson.new
  end

  def create
    @absence = Absence.new(absence_params)
    @lesson = Lesson.new(lesson_params)

    occurs_on = params[:lesson][:occurs_on]
    @lesson = Lesson.find_by(course_id: current_user.course_id, occurs_on: occurs_on)

    @absence.user = current_user
    @absence.lesson = @lesson
    @absence.save

    # if @absence.save
    #   redirect_to root_path
    # else
    #   render 'absences/new', status: :unprocessable_entity
    # end
  end

  def index
  end

  private

  def absence_params
    params.require(:absence).permit(:user_id, :lesson_id)
  end

  def lesson_params
    params.require(:lesson).permit(:occurs_on, :course_id)
  end
end
