class UserRating < ApplicationRecord
  belongs_to :user

  validates_inclusion_of :score, :in => -5..5

  validates :user_id, presence: true
end
