ActiveAdmin.register Complain do
  decorate_with ComplainDecorator

  menu label: 'Жалобы', priority: 5

  actions :index, :destroy
  
  index do
    selectable_column
    id_column
    column 'Объект', :complainable
    column 'Тип', :complainable_type
    column 'Создано', :created_at
    actions 
  end

  controller do
    def scoped_collection
      super.includes :complainable
    end
  end
end
