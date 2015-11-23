class DiseaseCriteria < Criteria
  belongs_to :associatedDisease, :class => Disease

  def withDisease?
    true
  end

  def  associatedCriteria
    self.associatedDisease.name
  end

  def self.to_html_string
    "Con Enfermedad"
  end

end
