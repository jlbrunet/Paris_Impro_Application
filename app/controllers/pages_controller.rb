class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @course = Course.find(current_user.course_id)
    @absences = Absence.where(user_id: current_user.id)
    @lessons = []
    @absences.each do |absence|
      @lessons.push(Lesson.find(absence.lesson_id))
    end
  end
end
