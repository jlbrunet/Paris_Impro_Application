class AddRattrapagesLockedToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :rattrapages_locked, :boolean, default: false, null: false
  end
end
