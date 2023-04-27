class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :level
      t.string :location
      t.string :day
      t.time :hour

      t.timestamps
    end
  end
end
