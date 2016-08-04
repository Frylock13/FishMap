ActiveAdmin.register Banner do

  menu label: "Баннеры", priority: 10

  actions :index, :edit, :update, :destroy, :new, :create

  permit_params :body, :width, :height, :left, :top, :active

  index do
    selectable_column
    id_column
    column "ID", :id
    column "Включен", :active
    
    actions 
  end

  form do |f|
    f.inputs do
      f.input :body, label: 'Тело баннера'
      f.input :width, label: 'Ширина', placeholder: 'Пример: 100px, 100%'
      f.input :height, label: 'Высота', placeholder: 'Пример: 100px, 100%'
      f.input :left, label: 'Отступ слева', placeholder: 'Пример: 100px, 100%'
      f.input :top, label: 'Отступ справа', placeholder: 'Пример: 100px, 100%'
      f.input :active, label: 'Включен'
    end

    actions
  end
end
