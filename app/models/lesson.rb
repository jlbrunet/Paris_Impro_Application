class Lesson < ApplicationRecord
  belongs_to :course
  has_many :absences
  has_many :rattrapages
  has_many :places
  validates :occurs_on, presence: true
end
