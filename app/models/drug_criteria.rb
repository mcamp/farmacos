class DrugCriteria < Criteria
  belongs_to :associatedDrug, :class => Drug

  def withDrug?
    true
  end

  def self.to_html_string
    "Con Fármaco"
  end

end
