class CreateItemPurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :item_purchases do |t|
      t.references :item, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
