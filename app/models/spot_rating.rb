class SpotRating < ApplicationRecord
  belongs_to :spot
  belongs_to :user

  validates_inclusion_of :rating, :in => 1..5
  validates_uniqueness_of :user_id, :scope => :spot
end
