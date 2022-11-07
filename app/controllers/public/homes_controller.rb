class Public::HomesController < ApplicationController
  # before_action :authenticate_customer!, except: [:index, :show]
  def top
    @items = Item.all
  end

  def about
  end
end
