class Customer::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to customer_cart_items_path
  end


  def create
    @cart_items = CartItem.new(cart_item_params)
    @cart_items.customer_id = current_customer.id
    if cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       cart_item.quantity += params[:cart_item][:quantity].to_i
       cart_item.save
       redirect_to customer_cart_items_path
    else
       @cart_items.save
       redirect_to customer_cart_items_path
    end
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