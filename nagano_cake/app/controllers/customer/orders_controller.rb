class Customer::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orders_show = @order.orders_show
  end

  def confirmation
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.address = current_customer.address
      @order.post_code = current_customer.post_code
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      address = Address.find(params[:order][:order_address])
      @order.address =address.address
      @order.post_code = address.post_code
      @order.name = address.name
    elsif params[:order][:select_address] == "2"
      @order.address = params[:order][:address]
      @order.post_code = params[:order][:post_code]
      @order.name = params[:order][:name]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = CartItem.where(customer_id: current_customer.id)
    if @order.save
      current_customer.cart_items.each do |cart_item|
      @orders_show = OrdersShow.new
      @orders_show.order_id = @order.id
      @orders_show.item_id = cart_item.item_id
      @orders_show.price_tax = cart_item.item.price_tax
      @orders_show.quantity = cart_item.quantity
      @orders_show.save
      end
      @cart_items.destroy_all
      redirect_to customer_orders_message_path
    else
      render :new
    end
  end

  def message
  end

  private

  def order_params
   params.require(:order).permit( :customer_id, :post_code, :address, :name, :payment_method, :shipping, :billing_amount, :status)
  end

  def address_params
    params.require(:order).permit(:post_code, :address, :name)
  end
end
