class Lesson < ApplicationRecord
  belongs_to :course
  has_many :absences
  has_many :rattrapages
  validates :occurs_on, presence: true
end
