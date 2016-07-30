ActiveAdmin.register PlaceImage do

  menu label: 'Изображения', priority: 6

  actions :index, :show, :destroy

  index do
    column 'Место', :place
    column "Превью" do |image|
      image_tag image.image(:thumb)
    end
    column 'Создано', :created_at
    actions 
  end

  show do |place|
    attributes_table do
      row :place
      row :image do
        image_tag place.image.url(:original)
      end
      row :created_at
    end
  end

  controller do
    def scoped_collection
      super.includes :place
    end
  end
end
