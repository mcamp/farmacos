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

end
