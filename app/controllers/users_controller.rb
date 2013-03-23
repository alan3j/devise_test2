class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find request[:id]
    #-- debugger
  end
end
