class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.text :path, null: false
      t.string :name, null: false
      t.string :ancestry, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
