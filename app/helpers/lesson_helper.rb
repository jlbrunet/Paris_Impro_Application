module LessonHelper
  def absences_lesson(absences, lesson)
    absences.map do |absence|
      absence if absence.lesson_id == lesson.id
    end.compact
  end

  def rattrapages_lesson(rattrapages, absences, lesson)
    rattrapages_lesson = rattrapages.map do |rattrapage|
      rattrapage if rattrapage.lesson_id == lesson.id
    end.compact

    # rattrapages_lesson_students = rattrapages_lesson.map do |rattrapage|
    #   rattrapage if rattrapage.user.status == "student"
    # end.compact

    # # return rattrapages_lesson unless rattrapages_lesson_students.empty?

    # new_absences = absences.map do |absence|
    #   absence if absence.user.status == "student"
    # end.compact

    # diff = rattrapages_lesson_students.length - absences_lesson(new_absences, lesson).length

    # if diff > 0
    #   diff.times { rattrapages_lesson.pop }
    # end

    # rattrapages_lesson
  end
end
