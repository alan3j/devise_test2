class CustomersAndOrdersPdf < Prawn::Document
  def initialize(customers, view)
    super()
    @customers = customers
    @view = view
    #-- print_coordinates
    header
    body
  end

  def logo
  end

  def header
    width = bounds.right - bounds.left
    bounding_box([bounds.left, bounds.top], :width => width) do
      stroke_bounds
      text "All Customers and Orders", :size => 22
    end
  end

  def body
    width = bounds.right - bounds.left
    bounding_box([bounds.left, bounds.top - 40], :width => width) do

      @customers.each do |customer|
        text "#{customer.name} (#{customer.id})", :size => 14

        customer.orders.each do |order|
          text "#{order.order_date} (#{order.id})", :size => 12
        end
      end

    end

  end


  def print_coordinates
    text "top: #{bounds.top}"
    text "bottom: #{bounds.bottom}"
    text "left: #{bounds.left}"
    text "right: #{bounds.right}"
    move_down 10
    text "absolute top: #{sprintf "%.2f", bounds.absolute_top}"
    text "absolute bottom: #{sprintf "%.2f", bounds.absolute_bottom}"
    text "absolute left: #{sprintf "%.2f", bounds.absolute_left}"
    text "absolute right: #{sprintf "%.2f", bounds.absolute_right}"
  end

end
