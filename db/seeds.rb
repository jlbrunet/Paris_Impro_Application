# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

courses_csv_file = File.join("app/assets/data/courses.csv")
lessons_csv_file = File.join("app/assets/data/lessons.csv")

Place.destroy_all
Absence.destroy_all
Rattrapage.destroy_all
User.destroy_all
Lesson.destroy_all
Course.destroy_all

CSV.foreach(courses_csv_file, headers: :first_row, header_converters: :symbol) do |row|
  row[:hour] = Time.new(2001, 1, 1, row[:hour], row[:minute], 0)
  course = Course.new(row)
  course.save!
end

CSV.foreach(lessons_csv_file, headers: :first_row, header_converters: :symbol) do |row|
  occurs_on_created = Time.new(row[:occurs_on_year], row[:occurs_on_month], row[:occurs_on_day], row[:occurs_on_hour], row[:occurs_on_minutes], row[:occurs_on_seconds])
  row[:course_id] = Course.where(location: row[:location])[0].id.to_i
  lesson = Lesson.new(occurs_on: occurs_on_created, course_id: row[:course_id], location: row[:location])
  lesson.save!
end

if User.exists?(status: "admin")
  User.where(status: "admin")[0].course_id = Course.where(location: "Hauteville")[0].id
else
  user1 = User.new(
    first_name: "Admin",
    last_name: "Admin",
    status: "admin",
    email: "contact@paris-impro.com",
    password: "123456",
    course_id: Course.where(location: "Hauteville")[0].id
  )
  user1.save!
end

if User.exists?(status: "teacher")
  User.where(status: "teacher")[0].course_id = Course.where(location: "Hauteville")[0].id
else
  user2 = User.new(
    first_name: "Professeur",
    last_name: "Professeur",
    status: "teacher",
    email: "ateliers@paris-impro.com",
    password: "123456",
    course_id: Course.where(location: "Hauteville")[0].id
  )
  user2.save!
end

# Seed_test

# Courses

# course1 = Course.new(
#   location: "Hotel de Ville",
#   level: "Niveau 2",
#   day: "Lundi",
#   hour: Time.new(2001, 1, 1, 21, 0, 0)
# )
# course1.save!

# course2 = Course.new(
#   location: "Gare de l'Est",
#   level: "Niveau 1",
#   day: "Mardi",
#   hour: Time.new(2001, 1, 1, 21, 0, 0)
# )
# course2.save!

# course3 = Course.new(
#   location: "Strasbourg Saint-Denis",
#   level: "Niveau 1",
#   day: "Vendredi",
#   hour: Time.new(2001, 1, 1, 21, 0, 0)
# )
# course3.save!

# course4 = Course.new(
#   location: "Gare du Nord",
#   level: "Niveau 2",
#   day: "Mercredi",
#   hour: Time.new(2001, 1, 1, 21, 0, 0)
# )
# course4.save!

# course5 = Course.new(
#   location: "Strasbourg Saint-Denis",
#   level: "Niveau 3",
#   day: "Jeudi",
#   hour: Time.new(2001, 1, 1, 21, 0, 0)
# )
# course5.save!

# Users

# user2 = User.new(
#   first_name: "Aurore",
#   last_name: "Pinho e Silva",
#   status: "student",
#   email: "aurore@rattrape.fr",
#   password: "123456",
#   course_id: course1.id
# )
# user2.save!

# user3 = User.new(
#   first_name: "Julie",
#   last_name: "Brunet",
#   status: "student",
#   email: "julie@rattrape.fr",
#   password: "123456",
#   course_id: course2.id
# )
# user3.save!

# user4 = User.new(
#   first_name: "Maxime",
#   last_name: "Coquerelle",
#   status: "student",
#   email: "maxime@rattrape.fr",
#   password: "123456",
#   course_id: course3.id
# )
# user4.save!

# user5 = User.new(
#   first_name: "Maxime2",
#   last_name: "Coquerelle2",
#   status: "student",
#   email: "maxime2@rattrape.fr",
#   password: "123456",
#   course_id: course3.id
# )
# user5.save!

# Lessons

# lesson1_course1 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 4, 22, 0, 0),
#   course_id: course1.id
# )
# lesson1_course1.save!

# lesson2_course1 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 11, 22, 0, 0),
#   course_id: course1.id
# )
# lesson2_course1.save!

# lesson3_course1 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 18, 22, 0, 0),
#   course_id: course1.id
# )
# lesson3_course1.save!

# lesson1_course2 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 5, 22, 0, 0),
#   course_id: course2.id
# )
# lesson1_course2.save!

# lesson2_course2 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 12, 22, 0, 0),
#   course_id: course2.id
# )
# lesson2_course2.save!

# lesson3_course2 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 19, 22, 0, 0),
#   course_id: course2.id
# )
# lesson3_course2.save!

# lesson1_course3 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 8, 22, 0, 0),
#   course_id: course3.id
# )
# lesson1_course3.save!

# lesson2_course3 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 15, 22, 0, 0),
#   course_id: course3.id
# )
# lesson2_course3.save!

# lesson3_course3 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 22, 22, 0, 0),
#   course_id: course3.id
# )
# lesson3_course3.save!

# lesson1_course4 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 6, 22, 0, 0),
#   course_id: course4.id
# )
# lesson1_course4.save!

# lesson2_course4 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 13, 22, 0, 0),
#   course_id: course4.id
# )
# lesson2_course4.save!

# lesson3_course4 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 20, 22, 0, 0),
#   course_id: course4.id
# )
# lesson3_course4.save!

# lesson1_course5 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 7, 22, 0, 0),
#   course_id: course5.id
# )
# lesson1_course5.save!

# lesson2_course5 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 14, 22, 0, 0),
#   course_id: course5.id
# )
# lesson2_course5.save!

# lesson3_course5 = Lesson.new(
#   occurs_on: Time.new(2023, 9, 21, 22, 0, 0),
#   course_id: course5.id
# )
# lesson3_course5.save!

# Absences

# absence1 = Absence.new(
#   user_id: user3.id,
#   lesson_id: lesson1_course2.id
# )
# absence1.save!

# absence2 = Absence.new(
#   user_id: user4.id,
#   lesson_id: lesson1_course3.id
# )
# absence2.save!

# absence3 = Absence.new(
#   user_id: user3.id,
#   lesson_id: lesson2_course2.id
# )
# absence3.save!

# absence4 = Absence.new(
#   user_id: user2.id,
#   lesson_id: lesson1_course1.id
# )

# absence4.save!
