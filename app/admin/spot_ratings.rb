ActiveAdmin.register SpotRating do
  actions :all, except: [:new]
  
  index do
    column :spot_id
    column :spot
    column :user_id
    column :user
    column :rating
    column :created_at
    column :updated_at
  end
end
