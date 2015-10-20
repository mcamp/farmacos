class DrugsController < ApplicationController
  respond_to :json
  
  def index
    @disease = Disease.find(params[:disease_id])
    @drugs = @disease.drugs
    
    respond_with({drugs: @drugs, disease: @disease})
  end

end
