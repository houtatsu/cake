class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)

    if params[:order_detail][:making_status] == "in_production"
      @order.update(status: "in_production")
    end

    if @order_details.count == @order_details.where(making_status: "production_complete").count
      @order.update(status: "preparing_delivery")
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end