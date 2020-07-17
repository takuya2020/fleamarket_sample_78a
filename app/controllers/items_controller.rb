class ItemsController < ApplicationController
    
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
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
    params.require(:item).permit(:name, :text, :condition, :price, :rading_status, :conpleted_at, :brand, :shipping_charges, :days_until_delivery, :shipping_area, :category_id)
  end
end
