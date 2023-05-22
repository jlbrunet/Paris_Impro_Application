class AddLessonIdToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :places, :lesson, foreign_key: true
  end
end
