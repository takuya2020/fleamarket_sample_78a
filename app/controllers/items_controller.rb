class ItemsController < ApplicationController
  #  before_action :set_item_name, except: [:new, :edit]
    
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