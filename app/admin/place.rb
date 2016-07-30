ActiveAdmin.register Place do

  menu label: 'Места', priority: 4

  actions :index, :show,   :edit, :update, :destroy, :new, :create

  permit_params :title, :category_id, :description, :latitude, :longitude, :active, :created_at

  index do
    column 'Активен', :active
    column 'Заголовок', :title
    column 'Категория', :category
    column 'Описание', :description
    column 'Широта', :latitude
    column 'Долгота', :longitude
    column 'Посещения', :visits
    column 'Рейтинг', :rating
    column 'Кол-во отзывов', :reviews_count
    column 'Создан', :created_at
    actions 
  end

  form do |f|
    f.inputs do
      f.input :active, label: 'Активен'
      f.input :title, label: 'Заголовок'
      f.input :category_id, label: 'Категория', as: :select, collection: Category.all.map{|c| [c.name, c.id]}
      f.input :description, label: 'Описание'
      f.input :latitude, label: 'Долгота'
      f.input :longitude, label: 'Широта'
    end

    actions
  end

  member_action :approve, method: :patch do
    resource.update(active: true)
    redirect_to :back, notice: "Место подтвержено."
  end

  member_action :decline, method: :delete do
    resource.destroy!
    redirect_to :back, notice: "Место отклонено."
  end

  controller do
    def scoped_collection
      super.includes :category
    end
  end
end
