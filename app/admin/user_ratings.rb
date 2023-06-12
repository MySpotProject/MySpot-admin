ActiveAdmin.register UserRating do
  actions :all, except: [:new]
  
  index do
    selectable_column
    id_column
    column :user_id
    column :user
    column :score
    column :reason
    column :created_at
    column :updated_at
  end
end
