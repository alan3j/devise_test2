class HomeController < ApplicationController
  def index
    if user_signed_in?
      @topupdated_royaltyowners = RoyaltyOwner.order("updated_at DESC").limit(5)
      @topupdated_products = Product.order("updated_at DESC").limit(5)
    end
  end
end
