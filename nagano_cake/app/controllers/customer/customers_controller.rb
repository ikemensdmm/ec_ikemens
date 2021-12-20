class  Customer::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  private
  def customer_params
    params.require(:customers).permit(:email, :first_name, :last_name, :kana_first_name, :kana_last_name, :address, :post_code, :phone_number,)
  end

end

