ActiveAdmin.register Spot do
  permit_params :title, :description, :lng, :lat, :pools, :ramps, :rail, :ladder, :slide, :created_at, :updated_at, :author, :published
  action_item :publish, only: :show do
     link_to "Опубликовать", publish_admin_spot_path(spot), method: :put if !spot.published?
  end
  
  action_item :unpublish, only: :show do
    link_to "Скрыть", unpublish_admin_spot_path(spot), method: :put if spot.published?
  end

  member_action :publish, method: :put do
    spot = Spot.find(params[:id])
    spot.update(published: true)
    redirect_to admin_spot_path(spot)
  end

  member_action :unpublish, method: :put do
    spot = Spot.find(params[:id])
    spot.update(published: false)
    redirect_to admin_spot_path(spot)
  end

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :lng
    column :lat
    column :images do |spot|
      spot.images.map do |image|
        image_tag url_for(image), style: "height: 80px;width:auto;"
      end
    end
    column :pools
    column :ramps
    column :rail
    column :ladder
    column :slide
    column :created_at
    column :updated_at
    column :author
    column :published
    actions
  end

  form do |f|
      f.inputs do
          f.input :title
          f.input :description
          f.input :lng
          f.input :lat
          f.input :pools
          f.input :ramps
          f.input :rail
          f.input :ladder
          f.input :slide
          f.input :created_at
          f.input :updated_at
          f.input :author, :label => "Автор", :as => :select, :colletion => User.all.map{|u| ["#{u.email}", u.id]} 
          f.input :published
      end
  end

  filter :title
  filter :pools
  filter :ramps
  filter :rail
  filter :slide
end
