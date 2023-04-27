class ChangeTimeTypeInLessons < ActiveRecord::Migration[7.0]
  def change
    remove_column :lessons, :occurs_on, :time
    add_column :lessons, :occurs_on, :datetime
  end
end
