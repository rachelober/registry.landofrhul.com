class Admin::PetsController < ApplicationController
  before_filter :load_species
  
  # GET /pets
  # GET /pets.xml
  def index
    @pets = Pet.all(:order => "name ASC", :conditions => ['species_id = ?', @species])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @species }
    end
  end

  # GET /pets/1
  # GET /pets/1.xml
  def show
    @pet = Pet.find_by_reg(params[:reg])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pet }
    end
  end

  # GET /pets/new
  # GET /pets/new.xml
  def new
    @pet = Pet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pet }
    end
  end

  # GET /pets/1/edit
  def edit
    @pet = Pet.find(params[:id])
  end

  # POST /pets
  # POST /pets.xml
  def create
    @pet = @species.pets.build(params[:pet])

    respond_to do |format|
      if @pet.save
        flash[:notice] = 'Pet was successfully created.'
        format.html { redirect_to([:admin, @pet]) }
        format.xml  { render :xml => @pet, :status => :created, :location => @pet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pets/1
  # PUT /pets/1.xml
  def update
    @pet = @species.pets.find(params[:id])
    
    respond_to do |format|
      if @pet.update_attributes(params[:pet])
        flash[:notice] = 'Pet was successfully updated.'
        format.html { redirect_to([:admin, @pet]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.xml
  def destroy
    @pet = @species.pets.find(params[:id])
    @pet.destroy
    
    respond_to do |format|
      format.html { redirect_to(admin_pets_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def load_species
    @species = Species.find(params[:species_id])
  end
end
