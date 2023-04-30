class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @course = Course.find(current_user.course_id)

    @absences = Absence.where(user_id: current_user.id)
    @absences_lessons = []
    @absences.each do |absence|
      @absences_lessons.push(Lesson.find(absence.lesson_id))
    end

    @rattrapages = Rattrapage.where(user_id: current_user.id)
    @rattrapages_lessons = []
    @rattrapages.each do |rattrapage|
      @rattrapages_lessons.push(Lesson.find(rattrapage.lesson_id))
    end
  end
end
