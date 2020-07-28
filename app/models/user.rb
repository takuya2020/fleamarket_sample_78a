class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,presence: true, uniqueness: true
  devise :validatable, password_length: 7..128
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }                             
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :items
  has_many :cards, dependent: :destroy
end
