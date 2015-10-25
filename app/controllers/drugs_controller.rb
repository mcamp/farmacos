class DrugsController < ApplicationController
  respond_to :json
  
  def index
    @disease = Disease.find(params[:disease_id])
    @drugs = @disease.drugs.sort_alphabetical_by{|drug| drug.name}
    
    respond_with({drugs: @drugs, disease: @disease})
  end

end
