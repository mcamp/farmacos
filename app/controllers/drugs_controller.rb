class DrugsController < ApplicationController
  respond_to :json
  
  def index

    @disease = Disease.find(params[:disease_id])
    if @disease.nil?
      @disease = Disease.new
      @drugs = Drug.all
    else
      @drugs = @disease.drugs
    end
    @drugs = @drugs.sort_alphabetical_by{|drug| drug.name}
  end

  def show
    @drug = Drug.find(params[:id])
  end

  def select_index
    @drugs = Drug.all.sort_alphabetical_by{|drug| drug.name}
    render partial: 'select_index', layout: false if request.xhr?
  end

  def update
    @drug = Drug.find(params[:id])
    @drug.update_attributes(params)
    render json: @drug
  end

end
