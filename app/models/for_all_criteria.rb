class ForAllCriteria < Criteria

  def criteria 
    self.class.to_html_string
  end

  def self.to_html_string
    "Para Todo"
  end

end
