class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true
    validates :password_confirmation, presence:true
    validates :password, length: { minimum: 8}

end
