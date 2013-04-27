class CustomersController < ApplicationController
  before_filter :authenticate_user!

  require 'customersandorders_pdf.rb'

  def index
    @customers = Customer.find :all, :order => 'id'

    respond_to do |format|
      format.html
      format.pdf do
        pdf = CustomersAndOrdersPdf.new(@customers, view_context)
        send_data pdf.render, disposition: "render", type: "application/pdf"
      end
    end

  end

end
