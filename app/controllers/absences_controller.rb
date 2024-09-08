class AbsencesController < ApplicationController
  def new
    if current_user.status == "teacher" || current_user.status == "admin"
      redirect_to courses_path
    else
      redirect_to root_path if Absence.where(user: current_user).count >= 9
      lessons_user = Lesson.where(course_id: current_user.course_id)
      available_lessons = lessons_user.select { |lesson| absence_available?(lesson) && more_than_13h?(lesson) }
      @available_dates = available_lessons.map { |d| d.occurs_on.strftime("%Y-%m-%d %H:%M:%S") }
      @lesson = Lesson.new
    end
  end

  def create
    occurs_on = params[:lesson][:occurs_on]
    user_course_id = current_user.course_id
    lesson = Lesson.find_by("DATE_TRUNC('day', occurs_on) = ? AND course_id = ?", occurs_on.to_date, user_course_id)
    absence = Absence.new(user_id: current_user.id, lesson_id: lesson.id)
    absence.save
    redirect_to root_path
  end

  def destroy
    absence = Absence.find(params[:id])
    absence.destroy
    course = Course.find(Lesson.find(absence.lesson_id).course_id)
    redirect_to course_lessons_path(course)
  end

  private

  def absence_available?(lesson)
    Absence.find_by(lesson: lesson, user: current_user).nil?
  end

  def more_than_13h?(lesson)
    ((lesson.occurs_on - DateTime.now) / 3600) > 13
  end
end
