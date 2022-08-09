# email:string
# name:string
# password_digest:string
#
# password:string virtual by has_secure_password
# password_confirmation:string virtual by has_secure_password
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_secure_password

  # validation
  validates :name, presence: true
  validates :password, length: { minimum: 8 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valite email addres" }
end
