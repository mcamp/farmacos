desc "fix name to downcase with uniform unicode"
task fix_name_format: :environment do
  
  Disease.all.each do |disease|
    disease.name = UnicodeUtils.downcase(disease.name)
    disease.save
  end
  Drug.all.each do |drug|
    drug.name = UnicodeUtils.downcase(drug.name)
    drug.save
  end
end