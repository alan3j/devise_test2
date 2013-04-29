class RoyaltyOwnersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @royalty_owner = RoyaltyOwner.find params[:id]
  end

end

