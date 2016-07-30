class ComplainDecorator < Draper::Decorator
  delegate_all

  def complainable_type
    object.complainable_type == 'Place' ? 'Место' : 'Отзыв'
  end

end
