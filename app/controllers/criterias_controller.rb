class CriteriasController < ApplicationController
  respond_to :json
  
  def new
    @criteria = Criteria.new
    @drug = Drug.find(params[:drug_id])
    @criterias = Criteria.allCriterias
    @ctypes = Criteria.allTypes
  end

  def create
    @drug = Drug.find(params[:drug_id])
    @criteria = params[:criteria].constantize.new
    @criteria.drug = @drug
    @criteria.description = params[:description]
    @criteria.ctype = params[:ctype]

    if @criteria.withDisease?
      @associatedDisease = Disease.find(params[:associatedDisease])
      @criteria.associatedDisease = @associatedDisease
    end

    if @criteria.withDrug?
      @associatedDrug = Drug.find(params[:associatedDrug])
      @criteria.associatedDrug = @associatedDrug
    end

    if @criteria.custom?
      @criteria.restriction = params[:customRestriction]
    end

    @criteria.save!
  end

  def destroy
    @criteria = Criteria.find(params[:id])
    @criteria.destroy
  end

  # def edit
  #   @criteria = Criteria.find(params[:id])
  #   @drug = Drug.find(params[:drug_id])
  #   @criterias = Criteria.allCriterias
  #   @ctypes = Criteria.allTypes
  # end

  # def update
  #   @criteria = Criteria.find(params[:id])
  #   @criteria = params[:criteria].constantize.new
  #   @criteria.drug = @drug
  #   @criteria.description = params[:description]
  #   @criteria.ctype = params[:ctype]
  #   @criteria.save!
  # end

end
