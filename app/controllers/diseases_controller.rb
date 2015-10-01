class DiseasesController < ApplicationController
  
  def index
    @diseases = Disease.all
  end

end
