ActiveAdmin.register User do
  permit_params :nickname, :email, :vk, :tg, :confirmed_at, :avatar
  actions :all, except: [:new]
  index do
    selectable_column
    id_column
    column :email
    column :nickname
    column :vk
    column :tg
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
      row :avatar do |user|
        image_tag (user.avatar.attached? ? url_for(user.avatar) : ""), style: "height: 80px;width:auto;"
      end
      row :created_at
      row :confirmed_at
    end
  end

  form do |f|
    f.inputs do
      f.input :nickname
      f.input :avatar, as: :file
      f.input :email
      f.input :confirmed_at
      f.input :vk
      f.input :tg
    end
    f.actions
end

  filter :email
  filter :nickname
  filter :created_at
end
