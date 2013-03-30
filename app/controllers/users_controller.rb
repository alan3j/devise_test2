class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.find :all, :order => 'id'
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

end
