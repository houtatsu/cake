class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:id])
    @shipping_cost = 800
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if params[:order][:status] == "payment_confirmation"
      @order.order_details.each do |order_detail|
        order_detail.update(making_status: "production_pending")
      end
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
