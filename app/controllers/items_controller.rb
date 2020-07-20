class ItemsController < ApplicationController
    
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.create(item_params)
    @items.user = current_user
  end

  def search
    if params[:keyword].present?
      @Items = Item.where('item LIKE ?', "%#{params[:keywoed]}%")
    else
      @Items = Item.none
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :condition, :price, :rading_status, :completed_at, :brand, :shipping_charges, :days_until_delivery, :shipping_area, :category_id, item_images: [:item_id, :image_url])
  end
end
