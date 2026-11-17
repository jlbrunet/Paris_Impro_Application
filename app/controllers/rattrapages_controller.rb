class RattrapagesController < ApplicationController
  before_action :require_rattrapage_left, only: %i[new create]

  def new
    if current_user.status == "teacher" || current_user.status == "admin"
      redirect_to courses_path
    else
      @rattrapage_lessons = Lesson.where(id: session[:available_lessons_ids]).includes(:course).reject do |lesson|
        lesson.course.rattrapages_locked?
      end
      @lesson = Lesson.new
    end
  end

  def create
    occurs_on = params[:lesson][:occurs_on]
    course_id = params[:lesson][:course_id].to_i
    lesson = Lesson.where("DATE_TRUNC('day', occurs_on) = ?", occurs_on.to_date).find_by(course_id: course_id)

    if lesson.nil? || lesson.course.rattrapages_locked?
      redirect_to root_path
      return
    end

    if current_user.rattrapage_lessons.any? { |booked| booked.overlaps?(lesson) }
      redirect_to root_path, alert: "Tu as déjà un rattrapage à ce créneau."
      return
    end

    places_ouvertes = Absence.where(lesson_id: lesson.id, is_taken: false).joins(:user).where(users: { status: "admin" })
    absences = Absence.where(lesson_id: lesson.id).joins(:user).where(users: { status: "student" })
    take_place_ouverte = absences.length <= Rattrapage.where(lesson_id: lesson.id).length

    rattrapage = Rattrapage.new(user_id: current_user.id, lesson_id: lesson.id)
    unless rattrapage.save
      redirect_to root_path, alert: "Ce rattrapage n'a pas pu être enregistré."
      return
    end

    if take_place_ouverte
      last_absence = places_ouvertes.last
      last_absence&.update!(is_taken: true)
    end
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
