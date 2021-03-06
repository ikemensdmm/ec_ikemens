class Customer::AddressesController < ApplicationController

    def index
      @address = Address.new
      @addresses = Address.all
    end

    def create
      address = Address.new(address_params)
      address.customer_id = current_customer.id
      if address.save
      flash[:success] = '配送先を登録しました'
        redirect_to customers_addresses_path
      else
        flash[:danger] = '必要情報を入力してください／ハイフンは使用できません'
        redirect_to customers_addresses_path
      end
    end

    def edit
      @address = Address.find(params[:id])
    end

    def update
      address = Address.find(params[:id])
      if address.update(address_params)
        flash[:success] = '編集を保存しました'
        redirect_to customer_address_path
      else
        @address = Address.find(params[:id])
        flash[:danger] = '必要情報を入力してください／ハイフンは使用できません'
        render "customer/addresses/edit"
      end
    end

    def destroy
      address = Address.find(params[:id])
      address.destroy
      flash[:success] = '削除しました'
      redirect_to customers_address_pat
    end

    private

    def address_params
      params.require(:address).permit(:post_code, :receiver_name,)
    end
end