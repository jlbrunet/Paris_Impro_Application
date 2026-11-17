class Lesson < ApplicationRecord
  # Two lessons starting closer than this overlap: a student can't follow both
  # (e.g. 20h and 20h15, but 10h30 and 20h are fine).
  COURSE_DURATION = 2.5.hours

  belongs_to :course
  has_many :absences
  has_many :rattrapages
  has_many :places
  validates :occurs_on, presence: true

  def overlaps?(other)
    (occurs_on - other.occurs_on).abs < COURSE_DURATION
  end
end
