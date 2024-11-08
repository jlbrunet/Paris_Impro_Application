saint_denis_course = Course.find_by(location: "Saint-Denis");
saint_denis_course.teacher = "Etienne J, Ingrid D"
saint_denis_course.save!
p saint_denis_course

saint_paul_course = Course.find_by(location: "Saint-Paul");
saint_paul_course.hour = saint_paul_course.hour - 15.minute
saint_paul_course.save!
p saint_paul_course

peletier_course = Course.find_by(location: "Lepeltier");
peletier_course.hour = peletier_course.hour - 15.minute
peletier_course.save!
p peletier_course

saint_paul_lessons = Lesson.where(course_id: saint_paul_course.id)
saint_paul_lessons.each do |lesson|
  lesson.occurs_on = lesson.occurs_on - 15.minute
  lesson.save!
end
p saint_paul_lessons.last

peletier_lessons = Lesson.where(course_id: peletier_course.id)
peletier_lessons.each do |lesson|
  lesson.occurs_on = lesson.occurs_on - 15.minute
  lesson.save!
end
p peletier_lessons.last

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
