ActiveAdmin.register User do
  permit_params :nickname, :email, :vk, :tg, :mail
  actions :all, except: [:new]
  index do
    selectable_column
    id_column
    column :email
    column :nickname
    column :vk
    column :tg
    column :mail
    column :avatar do |user|
      image_tag (user.avatar.attached? ? url_for(user.avatar) : ""), style: "height: 80px;width:auto;"
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :nickname
      row :vk
      row :tg
      row :mail
      row :avatar do |user|
        image_tag (user.avatar.attached? ? url_for(user.avatar) : ""), style: "height: 80px;width:auto;"
      end
      row :created_at
    end
  end

  filter :email
  filter :nickname
  filter :created_at
end
