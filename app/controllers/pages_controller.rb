class PagesController < ApplicationController
  def home
    if current_user.status == "teacher" || current_user.status == "admin"
      redirect_to courses_path
    else
      @course = Course.find(current_user.course_id)
      absences = Absence.where(user: current_user).sort_by(&:lesson_id)
      @absences_lessons = absences.map { |absence| Lesson.find(absence.lesson_id) }
      rattrapages = Rattrapage.where(user: current_user).sort_by(&:lesson_id)
      @rattrapages_lessons = rattrapages.map { |rattrapage| Lesson.find(rattrapage.lesson_id) }
    end
  end
end
