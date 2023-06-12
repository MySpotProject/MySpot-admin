class News < ApplicationRecord
    has_many_attached :images

    validates :title, :description, presence: true
    validates :images, limit: { max: 2 }, content_type: ['image/png', 'image/jpeg'], size: { between: 1.kilobyte..5.megabytes , message: 'is not given between size' }
end
