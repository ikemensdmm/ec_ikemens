class Customer::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @item_count = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def items_params
    parmas.require(:item).permit(:genre_id, :name, :introduction, :price, :is_status, :image_id)
  end
end
