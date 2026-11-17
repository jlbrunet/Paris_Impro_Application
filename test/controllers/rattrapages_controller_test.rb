require "test_helper"

class RattrapagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    # Student of the Tuesday 20h course, booking on the following Wednesday.
    @wednesday = 1.week.from_now.to_date.next_occurring(:wednesday)
    @student = create_user(create_course(day: "Mardi", hour: 20), "student@example.com")
    @admin = create_user(@student.course, "admin@example.com", status: "admin")
    declare_absences(2)
    sign_in @student
  end

  test "refuses more rattrapages than absences" do
    Rattrapage.create!(user: @student, lesson: open_lesson(hour: 10))
    Rattrapage.create!(user: @student, lesson: open_lesson(hour: 14))
    lesson = open_lesson(hour: 20)

    get rattrapages_new_path
    assert_redirected_to root_path

    assert_no_difference -> { Rattrapage.count } do
      book(lesson)
    end
    assert_redirected_to root_path
  end

  test "books a rattrapage" do
    lesson = open_lesson(hour: 20)

    assert_difference -> { Rattrapage.where(user: @student).count }, 1 do
      book(lesson)
    end
    assert_redirected_to rattrapage_show_path(Rattrapage.last)
  end

  test "refuses a second rattrapage at the same time in another course" do
    Rattrapage.create!(user: @student, lesson: open_lesson(hour: 20))
    other_course_lesson = open_lesson(hour: 20)

    assert_no_difference -> { Rattrapage.count } do
      book(other_course_lesson)
    end
    assert_redirected_to root_path
  end

  test "refuses a rattrapage overlapping a booked one" do
    Rattrapage.create!(user: @student, lesson: open_lesson(hour: 20))

    assert_no_difference -> { Rattrapage.count } do
      book(open_lesson(hour: 21))
    end
    assert_redirected_to root_path
  end

  test "allows a second rattrapage the same day at a distant time" do
    Rattrapage.create!(user: @student, lesson: open_lesson(hour: 20))

    assert_difference -> { Rattrapage.count }, 1 do
      book(open_lesson(hour: 10, minute: 30))
    end
  end

  test "booking the same lesson twice fails cleanly without using a place ouverte" do
    lesson = open_lesson(hour: 20)
    Rattrapage.create!(user: @student, lesson: lesson)
    place = Absence.create!(user: @admin, lesson: lesson)

    assert_no_difference -> { Rattrapage.count } do
      book(lesson)
    end
    assert_redirected_to root_path
    assert_not place.reload.is_taken
  end

  private

  def book(lesson)
    post rattrapages_path, params: { lesson: { occurs_on: lesson.occurs_on.to_s, course_id: lesson.course_id } }
  end

  # Absences on the student's own Tuesday lessons in the coming weeks.
  def declare_absences(count)
    tuesday = @wednesday - 1
    count.times do |i|
      own_lesson = Lesson.create!(course: @student.course, occurs_on: Time.utc(tuesday.year, tuesday.month, tuesday.day, 20) + i.weeks)
      Absence.create!(user: @student, lesson: own_lesson)
    end
  end

  def create_course(day:, hour:, minute: 0)
    Course.create!(level: "Initié | 2", location: "Équipe #{day} #{hour}h#{minute}", day: day,
                   hour: Time.utc(2000, 1, 1, hour, minute), minute: minute)
  end

  def create_user(course, email, status: "student")
    User.create!(email: email, password: "password", first_name: "A", last_name: "B",
                 status: status, course: course)
  end

  # A Wednesday lesson of a new course, with one student absent.
  def open_lesson(hour:, minute: 0)
    course = create_course(day: "Mercredi", hour: hour, minute: minute)
    lesson = Lesson.create!(course: course,
                            occurs_on: Time.utc(@wednesday.year, @wednesday.month, @wednesday.day, hour, minute))
    absent = create_user(course, "absent#{lesson.id}@example.com")
    Absence.create!(user: absent, lesson: lesson)
    lesson
  end
end
