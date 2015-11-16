class DrugsController < ApplicationController
  respond_to :json
  
  def index

    @disease = Disease.find(params[:disease_id])
    if @disease.nil?
      @disease = Disease.new
      @drugs = Drug.all
    else
      @drugs = @disease.drugs.sort_alphabetical_by{|drug| drug.name}
    end
  end

  def show
    @drug = Drug.find(params[:id])
  end

end
