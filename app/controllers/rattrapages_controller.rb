class RattrapagesController < ApplicationController
  def new
    if current_user.status == "teacher" || current_user.status == "admin"
      redirect_to courses_path
    else
      redirect_to root_path if Rattrapage.where(user: current_user).count >= 9
      @rattrapage_lessons = Lesson.where(id: session[:available_lessons_ids])
      @lesson = Lesson.new
    end
  end

  def create
    occurs_on = params[:lesson][:occurs_on]
    course_id = params[:lesson][:course_id].to_i
    lesson = Lesson.where("DATE_TRUNC('day', occurs_on) = ?", occurs_on.to_date).find_by(course_id: course_id)

    places_ouvertes = Absence.where(lesson_id: lesson.id, is_taken: false).joins(:user).where(users: { status: "admin" })
    absences = Absence.where(lesson_id: lesson.id).joins(:user).where(users: { status: "student" })
    if absences.length <= Rattrapage.where(lesson_id: lesson.id).length
      last_absence = places_ouvertes.last
      if last_absence
        last_absence.is_taken = true
        last_absence.save!
      end
    end

    rattrapage = Rattrapage.new(user_id: current_user.id, lesson_id: lesson.id)
    rattrapage.save
    redirect_to rattrapage_show_path(rattrapage)
  end

  def show
    if current_user.status == "teacher" || current_user.status == "admin"
      redirect_to courses_path
    else
      rattrapage = Rattrapage.find(params[:id])
      @lesson = Lesson.find(rattrapage.lesson_id)
    end
  end

  def destroy
    rattrapage = Rattrapage.find(params[:id])
    rattrapage.destroy
    course = Course.find(Lesson.find(rattrapage.lesson_id).course_id)
    redirect_to course_lessons_path(course)
  end
end
