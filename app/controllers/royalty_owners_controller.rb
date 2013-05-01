class RoyaltyOwnersController < ApplicationController
  before_filter :authenticate_user!

  require 'test2_helpers.rb'

  def index
#debugger
    @search_fields = RoyaltyOwner.search_fields

    index_set_session
    
    @royalty_owners = RoyaltyOwner.search(session[:search_field], 
      session[:search_term], session[:records_pp], params[:page], 
      session[:sort_order])

  end

  def show
    @royalty_owner = RoyaltyOwner.find params[:id]
  end

  #-- CONTROLLER HELPERS
  #========================================================

  def index_set_session
    #-- Records per page
    if params[:records_pp] && !params[:records_pp].blank? && params[:records_pp].numeric?
      session[:records_pp] = params[:records_pp].to_i
    else
      session[:records_pp] ||= 10
    end

    #-- Field to search
    if params[:search_field]
      session[:search_field] = params[:search_field]
    else
      session[:search_field] ||= ''
    end

    #-- Term to search for
    if params[:search_field] && params[:search_field] == ''
      params[:search_term] = session[:search_term] = nil
    end

    if params[:search_term]
      session[:search_term] = params[:search_term]
    else
      session[:search_term] ||= ''
    end

    #-- Sort order
    if params[:sort_order]
      session[:sort_order] = params[:sort_order]
    else
      session[:sort_order] ||= 'id'
    end
  end

end

