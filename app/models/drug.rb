class Drug
  include MongoMapper::Document

  key :name, :required => true, :unique => true

  # BEERS criteria
  key :beers, Boolean, :default => false
  key :beers_description

  # STOPP criteria
  key :stopp, Boolean, :default => false
  key :stopp_description

  #Cholinergic load (?)
  key :cholinergic_load, Integer, :default => 0

  def diseases
    return Disease.where(:drug_ids => d.id).all
  end
end
