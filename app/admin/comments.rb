ActiveAdmin.register Comment, as: "UserComment" do
  actions :all, except: [:new]
  
  index do
    selectable_column
    id_column
    column :user_id
    column :spot_id
    column :spot
    column :content
    column :created_at
  end
end
