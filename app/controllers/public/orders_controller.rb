class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def index
    @orders = Order.all
  end

  def create
    order_details = current_customer.cart_items.all
     @order = current_customer.orders.new(order_params)
    if @order.save
      order_details.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.price
        order_detail.save
      end
    redirect_to public_complete_path
    order_details.destroy_all
    end
  end

  def show
    @order = Order.find(params[:id])
    @shipping_cost = 800
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
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end
end
