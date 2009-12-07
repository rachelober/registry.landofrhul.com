class SpeciesController < ApplicationController
  # GET /species
  # GET /species.xml
  def index
    @species = Species.all(:order => "name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @species }
    end
  end

  # GET /species/1
  # GET /species/1.xml
  def show
    @species = Species.find(params[:id])    
    @pets = Pet.paginate(:conditions => ['species_id = ?', @species.id], :order => "regid ASC", :per_page => 50, :page => params[:page])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ets }
    end
  end
end
