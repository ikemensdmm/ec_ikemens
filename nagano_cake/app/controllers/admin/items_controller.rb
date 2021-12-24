class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
    @item_count = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admin_items_path(@item)
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :image, :description, :price, :is_status, :genre_id)
  end
end
