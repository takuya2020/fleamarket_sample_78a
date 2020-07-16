class Address < ApplicationRecord
    
    belongs_to :user, optional: true
    validates :first_name, :last_name, :first_name_kana, :last_name_kana, :zipcode, :prefecture, :city, :address, presence: true
    validates :first_name, :last_name, :first_name_kana, :last_name_kana, format:{ with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
    validates :zipcode, format:{ with:/\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/ }
end

