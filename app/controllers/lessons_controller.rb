class LessonsController < ApplicationController
  def index
    @user_c = current_user
    if @user_c.status == "student"
      redirect_to root_path
    else
      @user = current_user
      @course = Course.find(params[:course_id])
      @lessons = Lesson.where(course_id: @course.id)

      @absences = Absence.all
      @absences_students = []
      @absences_admin = []

      @absences.each do |absence|
        if absence.user.status == "student"
          @absences_students << absence
        else
          @absences_admin << absence
        end
      end

      @rattrapages_students = Rattrapage.all
      @rattrapages = []

      @rattrapages_students.each do |rattrapage|
        @rattrapages << rattrapage
      end
      @absences_admin.each do |absence|
        @rattrapages << absence
      end

      @place = Place.new
    end
  end

  def new
    @user_c = current_user
    if @user_c.status == "teacher" || @user_c.status == "admin"
      redirect_to courses_path
    else
      @available_dates = []
      @lessons = Lesson.where.not(course_id: current_user.course_id)
      @user_id = current_user.id
      @lessons.each do |lesson|
        if (Rattrapage.where(lesson_id: lesson.id).length < Absence.where(lesson_id: lesson.id).length) && (Course.find(lesson.course_id).level == Course.find(current_user.course_id).level) && Course.where(id: lesson.course_id)[0].day != Course.where(id: current_user.course_id)[0].day && lesson.occurs_on > DateTime.now()
          @available_dates << lesson.occurs_on
        end
      end
      @available_dates_string = @available_dates.map { |d| d.strftime("%Y-%m-%d %H:%M:%S %z") }
      @lesson = Lesson.new
    end
  end

  def create
    @occurs_on = params[:lesson][:occurs_on]
    @current_lessons_all_levels = Lesson.where("DATE_TRUNC('day', occurs_on) = ?", @occurs_on.to_date)
    @current_lessons_all = []
    @current_lessons_all_levels.each do |lesson|
      if Course.where(id: lesson.course_id)[0].level == Course.where(id: current_user.course_id)[0].level
        @current_lessons_all << lesson
      end
    end
    @current_lessons = []
    @current_lessons_all.each do |lesson|
      @current_lessons << lesson unless Absence.where(lesson_id: lesson.id)[0].nil?
    end
    session[:current_lessons_ids] = @current_lessons.pluck(:id)
    redirect_to rattrapages_new_path
  end

  def create_place
    @place_number = params[:place][:number].to_i
    @place_lesson = params[:place][:lesson_id].to_i
    @place_number.times do
      @absence = Absence.new(user_id: User.where(status: "admin")[0].id,
                             lesson_id: @place_lesson)
      @absence.save!
    end
    @course = Course.find(params[:course_id])
    redirect_to course_lessons_path(@course)
  end
end
