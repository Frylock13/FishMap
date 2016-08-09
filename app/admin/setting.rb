ActiveAdmin.register Setting do

  menu label: 'Настройки', priority: 12

  actions :index

  permit_params :name, :status
  
  index do
    column 'Название', :name
    column 'Статус', :status

    actions defaults: true do |setting|
      if setting.status == true
        link_to 'Выключить', turn_admin_setting_path(setting), method: :put
      else
        link_to 'Включить', turn_admin_setting_path(setting), method: :put
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name, label: 'Название'
      f.input :status, label: 'Статус'
    end
  end

  member_action :turn, method: :put do
    resource.status == true ? resource.update(status: false) : resource.update(status: true)
    redirect_to :back
  end
end
