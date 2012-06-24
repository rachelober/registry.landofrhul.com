class PetsController < ApplicationController
  # GET /pets
  # GET /pets.xml
  def index
    @species = Species.all(:order => "name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @species }
    end
  end

  # GET /pets/1
  # GET /pets/1.xml
  def show
    @species = Species.find_by_name(params[:species_name])
    @pet = Pet.first(:conditions => ['species_id = ? AND regid = ?', @species.id, params[:regid]])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pet }
    end
  end
end
