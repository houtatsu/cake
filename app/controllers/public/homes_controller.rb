class Public::HomesController < ApplicationController
  before_action :authenticate_customer!
  def top
    @items = Item.all
  end

  def about
  end
end
