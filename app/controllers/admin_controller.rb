class AdminController < ApplicationController
  def index
    @broken_url_pets = Pet.find_by_flags(:broken_url)
    @page_errors_pets = Pet.find_by_flags(:page_errors)
    @no_link_pets = Pet.find_by_flags(:no_link)
    @species = Species.find(:all)
  end
end
