class Drug
  include MongoMapper::Document

  many :criterias

  key :name, :required => true, :unique => true

  def diseases
    return Disease.where(:drug_ids => self.id).all
  end
end
