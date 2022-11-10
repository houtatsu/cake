class SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @admins = Admin.looks(params[:search], params[:word])
    end
  end
end
