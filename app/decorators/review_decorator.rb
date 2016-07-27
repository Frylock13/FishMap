class ReviewDecorator < Draper::Decorator
  delegate_all

  def posted_info
    author = name ? name : User.find(user_id).name
    "#{author} (#{created_at.strftime('%d.%m.%Y %H:%M')})"
  end
end
