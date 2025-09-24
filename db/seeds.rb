course1 = Course.find_by({location: "Cité"})
course1.location = "Cétaitpascité"
course1.info = "Centre Saad Sangat 7 cour de la ferme Saint Lazare 75010 Paris"
course1.save!

course2 = Course.find_by({location: "St Paul"})
course2.info = "Cité des arts, 18 rue de l'hôtel de ville 75004 paris métro pont marie ou st paul. STUDIO 3"
course2.save!

course3 = Course.find_by({location: "Rivoli"})
course3.info = "Cité des arts, 18 rue de l'hôtel de ville 75004 paris métro pont marie ou st paul. STUDIO 1"
course3.save!

# require "csv"

# User.destroy_all
# Rattrapage.destroy_all
# Absence.destroy_all
# Lesson.destroy_all
# Course.destroy_all

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
