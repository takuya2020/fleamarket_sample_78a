class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :show]

  def index
    @items = Item.includes(:item_images).order('created_at DESC').limit(4)
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  def show
    @item = Item.find(params[:id])
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
