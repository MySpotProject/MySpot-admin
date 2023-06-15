ActiveAdmin.register Spot do
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
    column :email
    column :nickname
    column :vk
    column :tg
    column :mail
    column :images do |spot|
      spot.images.map do |image|
        image_tag url_for(image), style: "height: 80px;width:auto;"
      end
    end
    column :created_at
    actions
  end

  

  filter :title
  filter :pools
  filter :ramps
  filter :rail
  filter :slide
end
