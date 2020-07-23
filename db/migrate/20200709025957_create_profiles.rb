class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :birthyear,null: false
      t.integer :birthmonth,null: false
      t.integer :birthday,null: false
      t.string :family_name, null: false
      t.string :personal_name, null: false
      t.string :family_name_kana, null: false
      t.string :personal_name_kana, null: false
    end
  end
end
