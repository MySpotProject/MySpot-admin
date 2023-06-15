ActiveAdmin.register Trick do
    permit_params :title, :description, :slug, :difficulty, images: []

    index do
        selectable_column
        id_column
        column :title
        column :description
        column :slug
        column :difficulty
        column :images do |trick|
            trick.images.map do |image|
                image_tag url_for(image), style: "height: 50px;width:auto;"
            end
        end
        column :created_at
        actions
    end

    def show
        attributes_table do
            row :title
            row :description
            row :slug
            row :difficulty
            row :images do |trick|
                trick.images.map do |image|
                    image_tag url_for(image), style: "height: 150px;width:auto;"
                end
            end
            row :created_at
        end
    end

    form do |f|
        f.inputs do
          f.input :title
          f.input :description
          f.input :slug
          f.input :difficulty
          f.input :images, as: :file, input_html: { multiple: true }
        end
        f.actions
    end
end
