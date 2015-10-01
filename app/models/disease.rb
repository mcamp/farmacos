class Disease
  include MongoMapper::Document

  key :name, :required => true, :unique => true
  key :drug_ids, Array 
  many :drugs, :in => :drug_ids
end
