class Family
  include MongoMapper::Document

  many :drugs
  
  key :name, :required => true, :unique => true
end
