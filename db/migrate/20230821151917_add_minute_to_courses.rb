class AddMinuteToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :minute, :integer
  end
end
