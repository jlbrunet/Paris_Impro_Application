module LessonHelper
  def absences_lesson(absences, lesson)
    absences.map do |absence|
      absence if absence.lesson_id == lesson.id
    end
  end

  def rattrapages_lesson(rattrapages, absences, lesson)
    rattrapages_lesson = rattrapages.map do |rattrapage|
      rattrapage if rattrapage.lesson_id == lesson.id
    end.compact


    rattrapages_lesson_students = rattrapages_lesson.map do |rattrapage|
      rattrapage if rattrapage.user.status == "student"
    end

    return rattrapages_lesson unless rattrapages_lesson_students.empty?

    diff = rattrapages_lesson_students.length - absences_lesson(absences, lesson).length

    if diff > 0
      diff.times { rattrapages_lesson.pop }
    end

    rattrapages_lesson
  end
end
