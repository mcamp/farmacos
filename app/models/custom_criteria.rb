class CustomCriteria < Criteria
  
  key :restriction  
  
  
  def associatedCriteria
    restriction  
  end

  def custom?
    true
  end

  def self.to_html_string
    "Personalizada"
  end

end
