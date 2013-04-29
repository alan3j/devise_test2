class HomeController < ApplicationController
  def index
    if user_signed_in?
      @ropm = RoyaltyownerProductMap.all
    end
    

    #-- @users = User.all
  end
end
