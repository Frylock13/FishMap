module Settingable
  extend ActiveSupport::Concern
  
  def is_places_moderation_on?
    Setting.find_by(key: 'places_moderation').status == true
  end
end