course = Course.find_by(location: "Saint-Denis")
course.day = "Lundi"
course.save!

course1 = Course.find_by(location: "Provence")
course1.teacher = "Romain Nardelli"
course1.save!

course2 = Course.find_by(location: "Gare de l'Est")
course2.teacher = "Victoire P, Eve B, Romain Nolag"
course2.save!

course3 = Course.find_by(location: "Cité")
course3.teacher = "Poloche, Romain Guyot, Antoine G"
course3.save!

course4 = Course.find_by(location: "Chabrol")
course4.teacher = "Lisa G, Étienne J, Romain Nolag"
course4.save!

lessons = Lesson.where(course_id: course.id)
lessons.each do |lesson|
  lesson.occurs_on = lesson.occurs_on - 1.day
  lesson.save!
end

lessons.each do |lesson|
  if lesson.occurs_on.day == 11 && lesson.occurs_on.month == 11
    lesson.destroy
  end
  if lesson.occurs_on.day == 9 && lesson.occurs_on.month == 6
    lesson.destroy
  end
end

Lesson.create({
  occurs_on: Time.new(2025, 6, 23, 20, 0, 0),
  course_id: course.id,
  location: course.location,
})

# require "csv"

# courses_csv_file = File.join("app/assets/data/courses.csv")
# lessons_csv_file = File.join("app/assets/data/lessons.csv")

# CSV.foreach(courses_csv_file, headers: :first_row, header_converters: :symbol) do |row|
#   row[:hour] = Time.new(2001, 1, 1, row[:hour], row[:minute], 0)
#   course = Course.new(row)
#   course.save!
# end

# CSV.foreach(lessons_csv_file, headers: :first_row, header_converters: :symbol) do |row|
#   occurs_on_created = Time.new(row[:occurs_on_year], row[:occurs_on_month], row[:occurs_on_day], row[:occurs_on_hour], row[:occurs_on_minutes], row[:occurs_on_seconds])
#   row[:course_id] = Course.where(location: row[:location])[0].id.to_i
#   lesson = Lesson.new(occurs_on: occurs_on_created, course_id: row[:course_id], location: row[:location])
#   lesson.save!
# end

# user1 = User.new({
#   email: "ateliers@paris-impro.com", password: "123456", course_id: Course.first.id, first_name: "Professeur", last_name: "Professeur", status: "teacher"
# })

# user1.save!

# user2 = User.new({
#   email: "professeur-support@paris-impro.com", password: "123456", course_id: Course.first.id, first_name: "Professeur-support", last_name: "Professeur-support", status: "teacher"
# })

# user2.save!

# user3 = User.new({
#   email: "contact@paris-impro.com", password: "123456", course_id: Course.first.id, first_name: "Admin", last_name: "Admin", status: "admin"
# })

# user3.save!

# user4 = User.new({
#   email: "admin-support@paris-impro.com", password: "123456", course_id: Course.first.id, first_name: "Admin-Support", last_name: "Admin-Support", status: "admin"
# })

# user4.save!
