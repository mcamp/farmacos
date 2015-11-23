class Drug
  include MongoMapper::Document

  many :criterias
  belongs_to :family

  key :name, :required => true, :unique => true
  key :anticholinergic_load, :default => "N/A"


  def diseases
    return Disease.where(:drug_ids => self.id).all
  end
end
