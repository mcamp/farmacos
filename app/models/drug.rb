class Drug
  include MongoMapper::Document

  many :criterias
  belongs_to :family

  key :name, :required => true, :unique => true


  def diseases
    return Disease.where(:drug_ids => self.id).all
  end
end
