require "test_helper"

class LessonsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    # Next Monday at least a week away, so every lesson below is in the future.
    @monday = 1.week.from_now.to_date.next_occurring(:monday)
    @course = create_course(day: "Lundi", hour: 20)
    @own_lesson = create_lesson(@course, 20)
    @student = create_user(@course, "student@example.com")
    # An absence two weeks later, so the student has a rattrapage to book.
    Absence.create!(user: @student, lesson: Lesson.create!(course: @course, occurs_on: @own_lesson.occurs_on + 2.weeks))
    sign_in @student
  end

  test "redirects once every absence has its rattrapage" do
    Rattrapage.create!(user: @student, lesson: open_lesson(day: "Mardi", hour: 20, on: @monday + 1))

    get lessons_new_path
    assert_redirected_to root_path

    post lessons_path, params: { lesson: { occurs_on: @monday.to_s } }
    assert_redirected_to root_path
  end

  test "offers a lesson far enough from the student's course on the same day" do
    morning_lesson = open_lesson(day: "Lundi", hour: 10, minute: 30)

    get lessons_new_path
    assert_includes response.body, date_string(morning_lesson)

    post lessons_path, params: { lesson: { occurs_on: @monday.to_s } }
    assert_equal [morning_lesson.id], session[:available_lessons_ids]
  end

  test "does not offer a lesson clashing with the student's course" do
    clashing_lessons = [open_lesson(day: "Lundi", hour: 20), open_lesson(day: "Lundi", hour: 20, minute: 15),
                        open_lesson(day: "Lundi", hour: 19, minute: 30)]

    get lessons_new_path
    clashing_lessons.each { |lesson| assert_not_includes response.body, date_string(lesson) }

    post lessons_path, params: { lesson: { occurs_on: @monday.to_s } }
    assert_empty session[:available_lessons_ids]
  end

  test "offers a clashing lesson once the student declared an absence that day" do
    clashing_lesson = open_lesson(day: "Lundi", hour: 20, minute: 15)
    Absence.create!(user: @student, lesson: @own_lesson)

    get lessons_new_path
    assert_includes response.body, date_string(clashing_lesson)

    post lessons_path, params: { lesson: { occurs_on: @monday.to_s } }
    assert_equal [clashing_lesson.id], session[:available_lessons_ids]
  end

  test "an absence on another day does not unlock a clashing lesson" do
    clashing_lesson = open_lesson(day: "Lundi", hour: 20, minute: 15)
    other_lesson = Lesson.create!(course: @course, occurs_on: @own_lesson.occurs_on + 1.week)
    Absence.create!(user: @student, lesson: other_lesson)

    get lessons_new_path
    assert_not_includes response.body, date_string(clashing_lesson)
  end

  test "never offers the student's own course" do
    Absence.create!(user: @student, lesson: @own_lesson)

    get lessons_new_path
    assert_not_includes response.body, date_string(@own_lesson)

    post lessons_path, params: { lesson: { occurs_on: @monday.to_s } }
    assert_empty session[:available_lessons_ids]
  end

  test "does not offer lessons overlapping a booked rattrapage" do
    tuesday = @monday + 1
    booked = open_lesson(day: "Mardi", hour: 20, on: tuesday)
    same_slot = open_lesson(day: "Mardi", hour: 20, on: tuesday)
    close_slot = open_lesson(day: "Mardi", hour: 21, on: tuesday)
    morning = open_lesson(day: "Mardi", hour: 10, minute: 30, on: tuesday)
    Rattrapage.create!(user: @student, lesson: booked)
    Absence.create!(user: @student, lesson: @own_lesson)

    get lessons_new_path
    [booked, same_slot, close_slot].each { |lesson| assert_not_includes response.body, date_string(lesson) }
    assert_includes response.body, date_string(morning)

    post lessons_path, params: { lesson: { occurs_on: tuesday.to_s } }
    assert_equal [morning.id], session[:available_lessons_ids]
  end

  private

  def date_string(lesson)
    lesson.occurs_on.strftime("%Y-%m-%d %H:%M:%S")
  end

  def create_course(day:, hour:, minute: 0)
    Course.create!(level: "Initié | 2", location: "Équipe #{day} #{hour}h#{minute}", day: day,
                   hour: Time.utc(2000, 1, 1, hour, minute), minute: minute)
  end

  def create_lesson(course, hour, minute = 0, on: @monday)
    Lesson.create!(course: course, occurs_on: Time.utc(on.year, on.month, on.day, hour, minute))
  end

  def create_user(course, email)
    User.create!(email: email, password: "password", first_name: "A", last_name: "B",
                 status: "student", course: course)
  end

  def create_absence(lesson)
    absent = create_user(lesson.course, "absent#{lesson.id}@example.com")
    Absence.create!(user: absent, lesson: lesson)
  end

  # A lesson of another course with a free place.
  def open_lesson(day:, hour:, minute: 0, on: @monday)
    create_lesson(create_course(day: day, hour: hour, minute: minute), hour, minute, on: on).tap { |lesson| create_absence(lesson) }
  end
end
