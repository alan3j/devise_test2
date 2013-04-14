class CustomersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @customers = Customer.find :all, :order => 'id'
  end
end
