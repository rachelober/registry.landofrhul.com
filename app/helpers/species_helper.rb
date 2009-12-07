module SpeciesHelper
  def species_display(species)
    if Species.exists?(species)
      return link_to("#{h(species.name)}", species)
    else
      return "Unknown"
    end
  end
end
