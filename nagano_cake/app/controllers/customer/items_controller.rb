class Customer::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item_count = Item.count
    @item_page = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  private
  def items_params
    parmas.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image_id)
  end
end
