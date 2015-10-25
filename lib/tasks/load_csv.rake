require 'csv'

desc "load csv with diseases and drugs values"
task load_csv: :environment do
  
  CSV.foreach(Rails.root+"data/diseases_drugs.csv") do |row|
    # begin
      compact_row = row.compact
      if compact_row.size >= 2
        disease = Disease.new
        disease.name = compact_row.second.strip
        
        drugs_row = compact_row[2..-1]
        drugs = drugs_row.collect{ |drug_name|
          Drug.find_or_initialize_by_name(drug_name.strip)
        }
    
        disease.drugs = drugs
        disease.save!
      end
    # rescue
    #   puts "problem with row: #{row}"
    # end
  end
end