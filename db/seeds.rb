# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Rattrapage.destroy_all
Absence.destroy_all
User.destroy_all
Lesson.destroy_all
Course.destroy_all

# Courses

course1 = Course.new(
  location: "Hotel de Ville",
  level: "Niveau 2",
  day: "Lundi",
  hour: Time.new(2001, 1, 1, 21, 0, 0)
)
course1.save!

course2 = Course.new(
  location: "Gare de l'Est",
  level: "Niveau 1",
  day: "Mardi",
  hour: Time.new(2001, 1, 1, 21, 0, 0)
)
course2.save!

course3 = Course.new(
  location: "Strasbourg Saint-Denis",
  level: "Niveau 1",
  day: "Vendredi",
  hour: Time.new(2001, 1, 1, 21, 0, 0)
)
course3.save!

course4 = Course.new(
  location: "Gare du Nord",
  level: "Niveau 2",
  day: "Mercredi",
  hour: Time.new(2001, 1, 1, 21, 0, 0)
)
course4.save!

course5 = Course.new(
  location: "Strasbourg Saint-Denis",
  level: "Niveau 3",
  day: "Jeudi",
  hour: Time.new(2001, 1, 1, 21, 0, 0)
)
course5.save!

# Users

user1 = User.new(
  first_name: "Noemie",
  last_name: "Nataf",
  status: "teacher",
  email: "admin@rattrape.fr",
  password: "123456"
)
user1.save!

user2 = User.new(
  first_name: "Aurore",
  last_name: "Pinho e Silva",
  status: "student",
  email: "aurore@rattrape.fr",
  password: "123456",
  course_id: course1.id
)
user2.save!

user3 = User.new(
  first_name: "Julie",
  last_name: "Brunet",
  status: "student",
  email: "julie@rattrape.fr",
  password: "123456",
  course_id: course2.id
)
user3.save!

user4 = User.new(
  first_name: "Maxime",
  last_name: "Coquerelle",
  status: "student",
  email: "maxime@rattrape.fr",
  password: "123456",
  course_id: course3.id
)
user4.save!

# Lessons

lesson1_course1 = Lesson.new(
  occurs_on: Time.new(2023, 9, 4, 22, 0, 0),
  course_id: course1.id
)
lesson1_course1.save!

lesson2_course1 = Lesson.new(
  occurs_on: Time.new(2023, 9, 11, 22, 0, 0),
  course_id: course1.id
)
lesson2_course1.save!

lesson3_course1 = Lesson.new(
  occurs_on: Time.new(2023, 9, 18, 22, 0, 0),
  course_id: course1.id
)
lesson3_course1.save!

lesson1_course2 = Lesson.new(
  occurs_on: Time.new(2023, 9, 5, 22, 0, 0),
  course_id: course2.id
)
lesson1_course2.save!

lesson2_course2 = Lesson.new(
  occurs_on: Time.new(2023, 9, 12, 22, 0, 0),
  course_id: course2.id
)
lesson2_course2.save!

lesson3_course2 = Lesson.new(
  occurs_on: Time.new(2023, 9, 19, 22, 0, 0),
  course_id: course2.id
)
lesson3_course2.save!

lesson1_course3 = Lesson.new(
  occurs_on: Time.new(2023, 9, 8, 22, 0, 0),
  course_id: course3.id
)
lesson1_course3.save!

lesson2_course3 = Lesson.new(
  occurs_on: Time.new(2023, 9, 15, 22, 0, 0),
  course_id: course3.id
)
lesson2_course3.save!

lesson3_course3 = Lesson.new(
  occurs_on: Time.new(2023, 9, 22, 22, 0, 0),
  course_id: course3.id
)
lesson3_course3.save!

lesson4_course3 = Lesson.new(
  occurs_on: Time.new(2023, 9, 8, 23, 0, 0),
  course_id: course3.id
)
lesson4_course3.save!

lesson1_course4 = Lesson.new(
  occurs_on: Time.new(2023, 9, 6, 22, 0, 0),
  course_id: course4.id
)
lesson1_course4.save!

lesson2_course4 = Lesson.new(
  occurs_on: Time.new(2023, 9, 13, 22, 0, 0),
  course_id: course4.id
)
lesson2_course4.save!

lesson3_course4 = Lesson.new(
  occurs_on: Time.new(2023, 9, 20, 22, 0, 0),
  course_id: course4.id
)
lesson3_course4.save!

lesson1_course5 = Lesson.new(
  occurs_on: Time.new(2023, 9, 7, 22, 0, 0),
  course_id: course5.id
)
lesson1_course5.save!

lesson2_course5 = Lesson.new(
  occurs_on: Time.new(2023, 9, 14, 22, 0, 0),
  course_id: course5.id
)
lesson2_course5.save!

lesson3_course5 = Lesson.new(
  occurs_on: Time.new(2023, 9, 21, 22, 0, 0),
  course_id: course5.id
)
lesson3_course5.save!

# Absences

absence1 = Absence.new(
  user_id: user3.id,
  lesson_id: lesson1_course2.id
)
absence1.save!

absence2 = Absence.new(
  user_id: user4.id,
  lesson_id: lesson1_course3.id
)
absence2.save!

absence3 = Absence.new(
  user_id: user3.id,
  lesson_id: lesson2_course2.id
)
absence3.save!
