ActiveAdmin.register User do
  permit_params :name, :nickname, :email, :vk, :tg, :mail
  actions :all, except: [:new]
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :nickname
    column :vk
    column :tg
    column :mail
    column :avatar do |avatar|
      image_tag url_for(avatar.image)
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :name
      row :nickname
      row :vk
      row :tg
      row :mail
      row :avatar do |avatar|
        image_tag url_for(avatar.image)
      end
      row :created_at
    end
  end

  filter :email
  filter :name
  filter :nickname
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :nickname
    end
    f.actions
  end
end
