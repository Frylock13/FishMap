class PlaceDecorator < Draper::Decorator
  delegate_all

  def coordinates
    "#{latitude} #{longitude}"
  end

  def posted_by
    author = user_id ? User.find(user_id).name : 'Гость'
    author
  end

  def posted_at
    created_at.strftime('%d.%m.%Y %H:%M')
  end

  def get_near_place_background
    if object.place_images.first.present?
      h.image_tag(object.place_images.first.image.url(:small), class: 'center')
    else
      h.image_tag 'places/near_missing.png', class: 'center'
    end
  end
end
