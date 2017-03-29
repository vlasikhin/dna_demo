class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable,
         omniauth_providers: [:vkontakte]

  validates :email, uniqueness: true
  validates :name, length: { minimum: 2,  maximum: 20 }, presence: true
  validates :document_scan, file_size: { less_than: 15.megabytes }

  mount_uploader :document_scan, DocumentScanUploader

  has_many :authorizations, dependent: :destroy

  def self.find_for_oauth(auth)
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid.to_s).first
    return authorization.user if authorization

    name = auth.info[:first_name]
    surname = auth.info[:last_name]
    city = auth.info[:location]
    url = 'http://vk.com/id' + auth.uid
    email = auth.info[:email]

    return nil if email.blank?

    user = User.where(email: email).first

    if user
      user.create_authorization(auth)
    else
      password = Devise.friendly_token[0, 20]
      user = User.create!(
          name: name,
          email: email,
          surname: surname,
          city: city,
          url: url,
          pending_approval: false,
          social_network: true,
          password: password,
          password_confirmation: password
      )
      user.create_authorization(auth)
    end
    user
  end

  def create_authorization(auth)
    authorizations.create(provider: auth.provider, uid: auth.uid)
  end

  def confirm_verification!
    transaction do
      update!(pending_approval: false)
    end
  end

  def decline_verification!
    transaction do
      update!(pending_approval: true)
    end
  end
end
