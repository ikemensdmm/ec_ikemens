class Customer::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

  def update
  @cart_item = CartItem.find(params[:id])
  @cart_item.update(cart_item_params)
  redirect_to customer_cart_items_path
end

def create
  @cart_item = current_customer.cart_items.new(cart_item_params)
  @cart_item.save
  redirect_to customer_cart_items_path
end

	def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to customer_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to customer_cart_items_path
	end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity,:item_id)
  end

end