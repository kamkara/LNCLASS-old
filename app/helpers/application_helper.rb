module ApplicationHelper
  #custom onglet Msg
  def title
    base_title = "LNCLASS"
    if @title.nil?
      base_title
    else
      "#{base_title} - #{@title}"
    end

  end
end
