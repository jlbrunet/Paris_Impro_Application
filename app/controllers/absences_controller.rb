class AbsencesController < ApplicationController
  def new
    @available_dates = []
    @user_id = current_user.id
    Lesson.where(course_id: current_user.course_id).each do |lesson|
      if (Absence.where(lesson_id: lesson.id, user_id: @user_id) == []) && (((lesson.occurs_on - DateTime.now) / 3600) > 24)
        @available_dates << lesson.occurs_on
      end
    end
    @available_dates_string = @available_dates.map { |d| d.strftime("%Y-%m-%d %H:%M:%S %z") }
    @lesson = Lesson.new
  end

  def create
    @occurs_on = params[:lesson][:occurs_on]
    @current_lessons = Lesson.where("DATE_TRUNC('day', occurs_on) = ?", @occurs_on.to_date)
    @course_id = current_user.course_id
    @current_lessons.each do |lesson|
      @current_lesson = lesson if lesson.course_id == @course_id
    end
    @absence = Absence.new(user_id: current_user.id, lesson_id: @current_lesson.id)
    @absence.save
    redirect_to root_path
  end

  def destroy
    @absence = Absence.find(params[:id])
    @user = User.find(@absence.user_id)
    @course = Course.find(@user.course_id)
    @absence.destroy
    redirect_to course_lessons_path(@course)
  end
end
