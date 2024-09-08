class AddFieldToPlaceOuverte < ActiveRecord::Migration[7.0]
  def change
    add_column :absences, :is_taken, :boolean, default: false
  end
end
