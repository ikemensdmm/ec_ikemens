class Customer::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
  end

  def confirmation
  end

  def message
  end
end
