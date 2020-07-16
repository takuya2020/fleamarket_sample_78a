class Profile < ApplicationRecord
    # devise :database_authenticatable, :registerable,
    # :recoverable, :rememberable, :validatable
    belongs_to :user, optional: true
    validates :birthyear, :birthmonth, :birthday, :family_name, :personal_name, :family_name_kana, :personal_name_kana, presence: true
    validates :birthyear, length: { is: 4 }
    validates :birthmonth, :birthday, length: { in: 1..2 }
    validates :birthyear, :birthmonth, :birthday, format: { with:/\A[0-9]+\z/ }
    validates :family_name, :personal_name, :family_name_kana, :personal_name_kana, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
end
