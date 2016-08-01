ActiveAdmin.register Review do

  menu label: 'Отзывы', priority: 7

  actions :index, :show, :destroy, :edit, :update

  permit_params :name, :review, :likes, :dislikes
  
  index do
    selectable_column
    id_column
    column 'Место', :place
    column "Имя", :name
    column 'Отзыв', :review
    column 'Рейтинг', :rating
    column 'Лайки', :likes
    column 'Дизлайки', :dislikes
    column 'Пользователь', :user
    column 'Создано', :created_at
    actions 
  end

  form do |f|
    f.inputs do
      f.input :name, label: 'Имя'
      f.input :review, label: 'Отзыв'
      f.input :likes, label: 'Лайки'
      f.input :dislikes, label: 'Дизлайки'
    end

    actions
  end

  controller do
    def scoped_collection
      super.includes :user, :place
    end
  end
end
