class Trick < ApplicationRecord
    has_many_attached :images, dependent: :destroy

    validates_inclusion_of :difficulty, :in => 1..3

    validates :title, :description, presence: true
    validates :slug, presence: true, uniqueness: true
    validates :images, attached: true, limit: { min: 1, max: 5 }, content_type: ['image/png', 'image/jpeg', 'image/gif'], size: { between: 1.kilobyte..5.megabytes , message: 'is not given between size' }
end
