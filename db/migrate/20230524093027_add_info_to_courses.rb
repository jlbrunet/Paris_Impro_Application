class AddInfoToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :info, :string
  end
end
