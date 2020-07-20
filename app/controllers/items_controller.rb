class ItemsController < ApplicationController
    
  def index
  end

  def search
    if params[:keyword].present?
      @Items = Item.where('item LIKE ?', "%#{params[:keywoed]}%")
    else
      @Items = Item.none
    end
  end
end


private
def item_params
  params.require(:item).permit(:nickname).merge(user_id: current_user.id)
end
