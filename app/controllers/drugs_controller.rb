class DrugsController < ApplicationController
  respond_to :json
  
  def index
    @disease = Disease.find(params[:disease_id])
    @drugs = @disease.drugs.sort_alphabetical_by{|drug| drug.name}
  end

  def show
    @drug = Drug.find(params[:id])
  end

end
