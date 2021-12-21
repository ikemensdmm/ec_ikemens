class  Customer::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to  customer_customer_path
  end

  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_withdrawal: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to customer_homes_about_path #topページは完成してないので仮のurl
  end

 private
  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :kana_first_name, :kana_last_name, :address, :post_code, :phone_number,)
  end

end

