ActiveAdmin.register Spot do
  permit_params :title, :description, :address, :lng, :lat, :author_id, :pools, :ramps, :rail, :ladder, :slide, :published

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
  #   column :lat
  #   column :pools
  #   column :ramps
  #   column :rail
  #   column :slide
    
  #   column :images do 
  #     image_tag @spot.images_attachments.url
  #   end

  #   column :created_at
  #   actions
  # end


  # show do
  #   attributes_table do
  #     row :images do
  #       image_tag admin_user.images.url
  #     end

  #     row :title
  #     row :description
  #     row :lng
  #     row :lat
  #     row :pools
  #     row :ramps
  #     row :rail
  #     row :slide
  # end
  filter :title
  filter :pools
  filter :ramps
  filter :rail
  filter :slide
  # filter :author, as :string


  # show do
  #   attributes_table do
  #     row :images do
  #       div do
  #         spot.images.each do |img|
  #           div do
  #             image_tag url_for(img), size: "200x200"
  #           end
  #         end
  #       end
  #     end

  #     row :title
  #   end
  # end
end
