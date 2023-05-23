class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :absences, dependent: :destroy
  has_many :rattrapages, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :course_id, presence: { message: "Cours requis" }
end
