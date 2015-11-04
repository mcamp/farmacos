class CriteriasController < ApplicationController
  respond_to :json
  
  def new
    @drug = Drug.find(params[:drug_id])
    @criterias = Criteria.allCriterias
  end

  def create
    @drug = Drug.find(params[:drug_id])
    @criteria = params[:criteria].constantize.new
    @criteria.drug = @drug
    @criteria.description = params[:description]
    @criteria.ctype = params[:ctype]
    @criteria.save!
  end

end
