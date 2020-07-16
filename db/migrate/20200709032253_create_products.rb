class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :category, null: false
      t.string :deliver_leadteme, null: false
      t.string :deliver_person, null: false
      t.string :deliver_way, null: false
      t.string :fresh_status, null: false
      t.string :form_area, null: false
      t.integer :price, null: false
      t.string :sell_status, null: false
      t.integer :size_id, null: false
      t.string :text, null: false
      t.string :title, null: false
      t.timestamps
    end
  end
end
