class AddLocationToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :location, :string
  end
end
