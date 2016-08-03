class PlaceDecorator < Draper::Decorator
  delegate_all

  include Rails.application.routes.url_helpers

  def coordinates
    "#{latitude} #{longitude}"
  end

  def posted_by
    author = user_id ? User.find(user_id).name : 'Гость'
    author
  end

  def posted_at
    created_at.localtime.strftime('%d.%m.%Y %H:%M')
  end

  def get_near_place_background
    if object.place_images.first.image.present?
      h.link_to place_path(object.id) do
        h.image_tag(object.place_images.first.image.url(:small), class: 'center place-main-image')
      end
    else
      h.content_tag :div, {class: 'image-block'} do
        h.link_to place_path(object.id) do
          h.haml_tag(:image, h.image_tag(object.category.marker_image(:small), class: 'near-marker-image'))
        end
      end
    end
  end
end
