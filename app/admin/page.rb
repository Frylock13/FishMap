ActiveAdmin.register Page do

  menu label: 'Страницы', priority: 4

  actions :index, :show, :edit, :update, :destroy, :new, :create

  permit_params :slug, :title, :body, :active, :seo_title, :seo_description, :seo_keywords

  index do
    column 'Ссылка', :slug
    column 'Заголовок', :title
    column 'Включен в меню', :active
    column 'SEO title', :seo_title
    actions 
  end

  form do |f|
    f.inputs do
      f.input :slug, label: 'Ссылка'
      f.input :title, label: 'Заголовок'
      f.input :body, label: 'Тело'
      f.input :active, label: 'Включен в меню'
      f.input :seo_title, label: 'SEO title'
      f.input :seo_description, label: 'SEO description'
      f.input :seo_keywords, label: 'SEO keywords'
    end

    actions
  end
end
