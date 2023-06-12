class Spot < ApplicationRecord
    has_many_attached :images
    has_many :spot_ratings
    has_many :comments

    belongs_to :author, class_name: "User"
    
    # validates :title, presence: true, length: { maximum: 10}

    validates :description, length: { maximum: 250 }
    validates :lng, :lat, :address, presence: true
    validates :pools, :ramps, :rail, :ladder, :slide, inclusion: [true, false]

    validates :images, attached: true, limit: { min: 1, max: 3 }, content_type: ['image/png', 'image/jpeg'], size: { between: 1.kilobyte..5.megabytes , message: 'is not given between size' }
end
