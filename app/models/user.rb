class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true

  validates :name, :surname, :phone_number, :city, :address, presence: true

  validates :name,          length: { minimum: 2,  maximum: 20 }
  validates :surname,       length: { minimum: 2,  maximum: 30 }
  validates :phone_number,  length: { minimum: 3,  maximum: 20 }
  validates :city,          length: { minimum: 3,  maximum: 20 }
  validates :address,       length: { minimum: 3,  maximum: 150 }

  validates :document_scan, file_size: { less_than: 15.megabytes }

  mount_uploader :document_scan, DocumentScanUploader
end
