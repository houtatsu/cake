class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:id])
    @shipping_cost = 800
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status, :making_status)
  end
end
