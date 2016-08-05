class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable,  :omniauthable,
         omniauth_providers: [:facebook, :vkontakte]

  def email_required?
    false
  end

  validates :name, presence: true

  has_many :places, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email

      if auth.provider == 'vkontakte'
        user.name = "#{auth.info.first_name} #{auth.info.last_name}"
      else
        user.name = auth.info.name
      end
      
      user.password = Devise.friendly_token[0,20]
    end
  end
end
