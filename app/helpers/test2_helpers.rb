class String
  def numeric?
    Float(self) != nil rescue false
  end
end

def sort_link(title, column, options = {})
  condition = options[:unless] if options.has_key?(:unless)
  sort_dir = params[:sort_dir] == 'up' ? 'down' : 'up'

  if session[:sort_order][/^\w+/] == column.to_s
    visi_span_beg = ""
    visi_span_end = ""
  else
    visi_span_beg = "<span class='hidden'>"
    visi_span_end = "</span>"
  end

  link_to_unless condition, "#{title} #{visi_span_beg}&nbsp;#{arrow}#{visi_span_end}".html_safe,
    request.parameters.merge( {:sort_order => column, :sort_dir => sort_dir} )
end

def sort_order(default)
  "#{(params[:sort_order] || default.to_s).gsub(/[\s;'\"]/,'')} #{params[:sort_dir] == 'down' ? 'DESC' : 'ASC'}"
end

def arrow
  params[:sort_dir].nil? ? "" : params[:sort_dir]== "down" ? "&#8595;" : "&#8593;"
end 