class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :content, presence: true
  validates_uniqueness_of :user_id, :scope => :spot
end 
