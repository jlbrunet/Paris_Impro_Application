class LessonsController < ApplicationController
  def index
    if current_user.status == "student"
      redirect_to root_path
    else
      @course = Course.find(params[:course_id])
      @lessons = Lesson.where(course_id: @course.id).select { |lesson| lesson.occurs_on > DateTime.now }
      @absences = Absence.joins(:user).where(users: { status: "student" })
      places_ouvertes = Absence.joins(:user).where(users: { status: "admin" })
      @rattrapages_and_places_ouvertes = Rattrapage.all + places_ouvertes
      @place = Place.new
    end
  end

  def create_place
    place_number = params[:place][:number].to_i
    place_lesson = params[:place][:lesson_id].to_i
    place_number.times do
      absence = Absence.new(user_id: User.find_by(status: "admin").id, lesson_id: place_lesson)
      absence.save
    end
    course = Course.find(params[:course_id])
    redirect_to course_lessons_path(course)
  end

  def new
    if current_user.status == "teacher" || current_user.status == "admin"
      redirect_to courses_path
    else
      redirect_to root_path if Rattrapage.where(user: current_user).count >= 9
      lessons = Lesson.where.not(course_id: current_user.course_id)
      available_lessons = lessons.select do |lesson|
        available_lesson?(lesson)
      end
      @available_dates = available_lessons.map { |d| d.occurs_on.strftime("%Y-%m-%d %H:%M:%S") }
      @lesson = Lesson.new
    end
  end

  def create
    occurs_on = params[:lesson][:occurs_on]
    lessons = Lesson.where("DATE_TRUNC('day', occurs_on) = ?", occurs_on.to_date)
    available_lessons = lessons.select { |lesson| same_level?(lesson) && available_absence?(lesson) }
    session[:available_lessons_ids] = available_lessons.map(&:id)
    redirect_to rattrapages_new_path
  end

  private

  def available_lesson?(lesson)
    same_level?(lesson) && other_day?(lesson) && future_date?(lesson) && available_absence?(lesson)
  end

  def same_level?(lesson)
    if current_user.course.level == "Débutant | 1"
      lesson.course.level == current_user.course.level
    elsif current_user.course.level == "Initié | 2" || current_user.course.level == "Intermédiaire | 3" || current_user.course.level == "Confirmé | 4"
      lesson_level = lesson.course.level.chars.last.to_i
      next_level = current_user.course.level.chars.last.to_i + 1
      lesson.course.level == current_user.course.level || next_level == lesson_level
    elsif current_user.course.level == "Expert | 5"
      lesson_level = lesson.course.level.chars.last.to_i
      precedent_level = current_user.course.level.chars.last.to_i - 1
      lesson.course.level == current_user.course.level || precedent_level == lesson_level
    else
      false
    end
  end

  def other_day?(lesson)
    lesson.course.day != current_user.course.day
  end

  def future_date?(lesson)
    lesson.occurs_on > DateTime.now
  end

  def available_absence?(lesson)
    Rattrapage.where(lesson_id: lesson.id).length < Absence.where(lesson_id: lesson.id).length
  end
end
