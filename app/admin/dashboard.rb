ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Места требующие подтверждения" do
          section do
            table_for Place.not_active.decorate do
              column :id
              column 'Название', :title
              column 'Создан', :created_at

              column '' do |place|
                link_to 'Перейти', admin_place_path(place.id)
              end

              column '' do |place|
                link_to 'Подтвердить', approve_admin_place_path(place.id),   
                                     method: :patch,
                                     confirm: 'Вы уверены, что хотите подтвердить место?'
              end

              column '' do |place|
                link_to 'Отклонить', decline_admin_place_path(place.id),   
                                     method: :delete,
                                     confirm: 'Вы уверены, что хотите отклонить место?'
              end
            end

            strong { link_to "Посмотреть все места", admin_places_path }
          end
        end
      end
    end
  end
end
