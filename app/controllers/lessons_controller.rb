class LessonsController < ApplicationController
  def index
    @user = current_user
    @course = Course.find(params[:course_id])
    @lessons = Lesson.where(course_id: @course.id)

    @absences = Absence.all
    @rattrapages = Rattrapage.all
  end
end
