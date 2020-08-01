class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :set_item, only: [:edit, :update, :destroy, :show]
  def index
    @items = Item.includes(:item_images).order('created_at DESC')
    @item_lodes = Item.includes(:item_images)
    @item_purchase = ItemPurchase.find_by(item_id: params[:id])
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      render :edit unless @item.update(item_params)
    else
      render :edit
    end
  end

  def destroy
  end

  def show
    @item_purchase = ItemPurchase.find_by(item_id: params[:id])
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
    params.require(:item).permit(:name, :text, :condition, :price, :completed_at, :brand, :shipping_charges, :days_until_delivery, :shipping_area, :category_id, item_images_attributes: [:image_url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end




private
def item_params
  params.require(:item).permit(:nickname).merge(user_id: current_user.id)
end
