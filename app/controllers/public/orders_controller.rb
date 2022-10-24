class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def index
  end

  def show
  end

  def comfilm
    #binding.pry
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :address_id, :postal_code, :name)
  end
end
