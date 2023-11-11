# require "csv"

# courses_csv_file = File.join("app/assets/data/courses.csv")
# lessons_csv_file = File.join("app/assets/data/lessons.csv")

# CSV.foreach(courses_csv_file, headers: :first_row, header_converters: :symbol) do |row|
#   row[:hour] = Time.new(2001, 1, 1, row[:hour], row[:minute], 0)
#   course = Course.new(row)
#   course.save!
# end

# CSV.foreach(lessons_csv_file, headers: :first_row, header_converters: :symbol) do |row|
#   occurs_on_created = Time.new(row[:occurs_on_year], row[:occurs_on_month], row[:occurs_on_day], row          [:occurs_on_hour], row[:occurs_on_minutes], row[:occurs_on_seconds])
#   row[:course_id] = Course.where(location: row[:location])[0].id.to_i
#   lesson = Lesson.new(occurs_on: occurs_on_created, course_id: row[:course_id], location: row[:location])
#   lesson.save!
# end
