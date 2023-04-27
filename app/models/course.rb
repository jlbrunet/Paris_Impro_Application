class Course < ApplicationRecord
  has_many :lessons
  validates :location, presence: true
  validates :level, presence: true
  validates :day, presence: true
  validates :hour, presence: true
end
