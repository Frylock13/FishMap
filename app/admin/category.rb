ActiveAdmin.register Category do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end

ActiveAdmin.register Category do

  menu label: "Категории", priority: 1

  actions :index, :edit, :update, :destroy, :new, :create

  permit_params :name, :slug, :marker_image

  index do
    #selectable_column
    column :id
    column "Название", :name
    column "Маркер" do |category|
      image_tag category.marker_image(:small)
    end
    actions 
  end

  form do |f|
    f.inputs do
      f.input :name, label: 'Название'
      f.input :marker_image, label: 'Маркер'
    end

    actions
  end
end
