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

course1 = Course.find_by(location: "Valmy")
course1.minute = 10
course1.save!

course2 = Course.find_by(location: "Valmy")
course2.hour = course2.hour.change(min: 10)
course2.save!

Lesson.where(location: "Valmy").each do |lesson|
  new_occurs_on = lesson.occurs_on.change(min: 10)
  lesson.occurs_on = new_occurs_on
  lesson.save!
end

course3 = Course.find_by(location: "La Villette")
course3.info = "83 rue du Faubourg Saint-Denis 75010, code porte1 B8962, code porte2 8360B, au fond à droite"
course3.save!

course4 = Course.find_by(location: "Saint-Denis")
course4.info = "83 rue du Faubourg Saint-Denis 75010, code porte1 B8962, code porte2 8360B, au fond à droite"
course4.save!

course5 = Course.find_by(location: "Sébastopol")
course5.info = "83 rue du Faubourg Saint-Denis 75010, code porte1 B8962, code porte2 8360B, au fond à droite"
course5.save!
