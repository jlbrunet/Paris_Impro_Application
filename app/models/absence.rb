class Absence < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :lesson_id, uniqueness: {
    scope: :user_id,
    message: "One absence per day per user"
  }, unless: -> { user&.status == 'admin' }
end
