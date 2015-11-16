class DiseasesController < ApplicationController
  
  def index
    @diseases = Disease.all.sort_alphabetical_by{|disease| disease.name}

    render partial: 'index', layout: false if request.xhr?
  end

end
