class DrugCriteria < Criteria
  belongs_to :associatedDrug, :class => Drug

  def associatedCriteria
    self.associatedDrug.name  
  end

  def withDrug?
    true
  end

  def self.to_html_string
    "Con Fármaco"
  end

end
