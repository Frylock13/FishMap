ActiveAdmin.register Category do

  menu label: "Категории", priority: 1

  actions :index, :edit, :update, :destroy, :new, :create

  permit_params :name, :slug, :marker_image

  index do
    selectable_column
    id_column
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
