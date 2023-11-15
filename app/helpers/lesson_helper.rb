module LessonHelper
  def lesson_occurs_on(lesson)
    lesson_occurs_on_minutes = I18n.l(lesson.occurs_on, format: "%A %-d %B %Y - %kh%M", locale: :fr)
    lesson_occurs_on_hour = I18n.l(lesson.occurs_on, format: "%A %-d %B %Y - %kh", locale: :fr)
    lesson_occurs_on = lesson.occurs_on.strftime("%M").to_i.positive? ? lesson_occurs_on_minutes : lesson_occurs_on_hour
    return lesson_occurs_on
  end
end
