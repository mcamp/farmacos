class Criteria
  include MongoMapper::Document

  belongs_to :drug

  key :ctype, :required => true
  key :description

  def criteria
    raise "SubclassResponsibility"
  end

  def self.allCriterias
    # all subclasses, for whatever reason >>subclasses is not working
    [ForAllCriteria]
  end

  def self.allTypes
    {:beers1 => "Beers 1", :beers2 => "Beers 2", :beers3 => "Beers 3", :stopp => "STOPP", :liss => "Liss"}
  end

end
