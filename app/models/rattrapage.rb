class Rattrapage < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :lesson_id, uniqueness: {
    scope: :user_id,
    message: "One rattrapage per day per user"
  }, unless: -> { user&.status == 'admin' }
end
