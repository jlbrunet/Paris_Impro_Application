module LessonHelper
  def lesson_occurs_on(lesson)
    lesson_occurs_on_minutes = I18n.l(lesson.occurs_on, format: "%A %-d %B %Y - %kh%M", locale: :fr)
    lesson_occurs_on_hour = I18n.l(lesson.occurs_on, format: "%A %-d %B %Y - %kh", locale: :fr)
    lesson_occurs_on = lesson.occurs_on.strftime("%M").to_i.positive? ? lesson_occurs_on_minutes : lesson_occurs_on_hour
    return lesson_occurs_on
  end

  def new_rattrapage_takes_place_ouverte(rattrapages, absences, lesson)
    rattrapages_and_places_ouvertes = rattrapages.select { |rattrapage| rattrapage.lesson_id == lesson.id }
    absences_students = absences.select { |absence| absence.lesson_id == lesson.id }

    rattrapages_students = rattrapages_and_places_ouvertes.select { |rattrapage| rattrapage.user.status == "student" }
    diff = rattrapages_students.length - absences_students.length
    diff.times { rattrapages_and_places_ouvertes_lesson.pop } if diff.positive?

    return rattrapages_and_places_ouvertes
  end
end
