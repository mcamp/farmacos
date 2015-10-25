class DiseasesController < ApplicationController
  
  def index
    @diseases = Disease.all.sort_alphabetical_by{|disease| disease.name}
  end

end
