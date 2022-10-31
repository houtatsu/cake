class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def index
    @orders = Order.all
  end

  def create
  end

  def show
  end

  def comfilm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @orders = Order.all
    @cart_items = CartItem.all
    @shipping_cost = 800
    @total_amount = 0
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order = Order.new(order_params)
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
