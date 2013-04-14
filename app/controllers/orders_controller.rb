class OrdersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @orders = Order.find :all, :order => 'id'
  end
end