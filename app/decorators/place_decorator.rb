class PlaceDecorator < Draper::Decorator
  delegate_all

  def coordinates
    "#{latitude} #{longitude}"
  end

  def posted_info
    author = user_id ? User.find(user_id).name : 'Гость'
    "#{author} (#{created_at.strftime('%d.%m.%Y %H:%M')})"
  end
end
