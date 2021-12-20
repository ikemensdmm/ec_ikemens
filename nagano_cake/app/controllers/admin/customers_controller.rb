class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
     @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = '会員情報を編集しました'
      redirect_to admin_customer_path(@customer)
    else
      flash[:danger] = '会員情報の編集に失敗しました'
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:kana_first_name,:kana_last_name,:email,:password,:post_code,:address,:phone_number,:is_withdrawal)
  end

end
