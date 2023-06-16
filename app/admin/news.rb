ActiveAdmin.register News do
    permit_params :title, :description

    index do
        selectable_column
        id_column
        column :title
        column :description
        column :created_at
        actions
    end
    
    show do
        attributes_table do
          row :title
          row :description
          row :created_at
        end
    end

    filter: title
    filter: description
    filter: created_at
end
