class OwnersController < ApplicationController
  # GET /owners
  # GET /owners.xml
  def index
    @owners = Owner.paginate(:order => "username ASC", :per_page => 30, :page => params[:page])    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @owners }
    end
  end

  # GET /owners/1
  # GET /owners/1.xml
  def show
    @owner = Owner.find(params[:id])
    @species = Species.find(:all, :order => "name ASC")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @owner }
    end
  end
end
