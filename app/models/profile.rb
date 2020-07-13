class Profile < ApplicationRecord
    # devise :database_authenticatable, :registerable,
    # :recoverable, :rememberable, :validatable
    belongs_to :user, optional: true
    validates :birthyear, :birthmonth, :birthday, :family_name, :personal_name, :family_name_kana, :personal_name_kana, presence: true
end
