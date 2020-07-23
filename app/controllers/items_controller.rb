class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.includes(:item_images).order('created_at DESC')
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
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :destloy
    end
  end

  def show
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
    params.require(:item).permit(:name, :text, :condition, :price, :rading_status, :completed_at, :brand, :shipping_charges, :days_until_delivery, :shipping_area, :category_id, item_images_attributes: [:image_url, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end




private
def item_params
  params.require(:item).permit(:nickname).merge(user_id: current_user.id)
end
