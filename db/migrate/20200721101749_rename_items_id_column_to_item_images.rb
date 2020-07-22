class RenameItemsIdColumnToItemImages < ActiveRecord::Migration[6.0]
  def change
    rename_column :item_images, :items_id, :item_id
  end
end
