class Criteria
  include MongoMapper::Document

  belongs_to :drug

  key :ctype, :required => true
  key :description

  def criteria
    self.class.to_html_string
  end

  def withDisease?
    false
  end

  def withDrug?
    false
  end

  def self.to_html_string
    raise "SubclassResponsibility"
  end

  def self.allCriterias
    # all subclasses, for whatever reason >>subclasses is not working
    [ForAllCriteria, DiseaseCriteria, DrugCriteria]
  end

  def self.allTypes
    {:beers1 => "Beers 1", :beers2 => "Beers 2", :beers3 => "Beers 3", :stopp => "STOPP", :liss => "Liss"}
  end

end
