class RoyaltyOwnersController < ApplicationController
  before_filter :authenticate_user!

  require 'test2_helpers.rb'

  def index
  ###############################################
    @search_fields = RoyaltyOwner.search_fields

    index_set_session
    
    @royalty_owners = RoyaltyOwner.search(session[:search_field], 
      session[:search_term], session[:records_pp], params[:page], 
      session[:sort_order], session[:sort_assoc])

  end

  def show
  ###############################################
    @royalty_owner = RoyaltyOwner.find params[:id]
  end

  #-- Maintain session variables
  def index_set_session
  ###############################################
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
    if !params[:sort_order].nil?
      session[:sort_order] = sort_order 'id'
    end

    #-- Sort Association
    if !params[:sort_assoc].nil?
      session[:sort_assoc] = params[:sort_assoc]
    end

  end
end


#========================================================
#-- HELPERS
#========================================================

  #-- Creates table header links in index.html.haml
  def sort_link(title, column, options = {}, association = {})
  ###############################################
    #-- Conditionally (:unless), don't make the link, I guess
    condition = options[:unless] if options.has_key?(:unless)

    #-- Toggle sort direction
    sort_dir = params[:sort_dir] == 'up' ? 'down' : 'up'
  
    #-- Display sort order arrow in the header of the sorted column only
    if session[:sort_order].nil? || session[:sort_order][/^\S+/] == column.to_s
      visi_span_beg = ""
      visi_span_end = ""
    else
      visi_span_beg = "<span class='hidden'>"
      visi_span_end = "</span>"
    end
  
    link_to_unless condition, "#{title} #{visi_span_beg}&nbsp;#{arrow}#{visi_span_end}".html_safe,
      request.parameters.merge( {:sort_order => column, :sort_dir => sort_dir, :sort_assoc => association} )
  end
  
  #-- Return the field and direction for ORDER BY, for example "id ASC"
  #-- Note that default is required but not used when params[:sort_order] is filled
  def sort_order(default)
  ###############################################
    "#{(params[:sort_order] || default.to_s).gsub(/[\s;'\"]/,'')} #{params[:sort_dir] == 'down' ? 'DESC' : 'ASC'}"
  end

  #--
  def arrow
  ###############################################
    params[:sort_dir].nil? ? "" : params[:sort_dir]== "down" ? "&#8595;" : "&#8593;"
  end 
