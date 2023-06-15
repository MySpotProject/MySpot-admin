ActiveAdmin.register SpotRating do
  actions :all, except: [:new]
  
  index do
    selectable_column
    id_column
    column :spot_id
    column :spot
    column :user_id
    column :rating
    column :created_at
    column :updated_at
  end
end
