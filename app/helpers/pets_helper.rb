module PetsHelper
  def pet_lineage(pet)
    if Pet.exists?(pet)
      return "#{(pet_display(pet.sire))} X #{(pet_display(pet.dam))}"
    else
      return "Unknown"
    end
  end
  
  def pet_display(pet)
    if Pet.exists?(pet)
      return link_to("#{h(pet.name)} (##{h(pet.reg)})", pet)
    else
      return "Unknown"
    end
  end
  
  def pet_url_display(pet)
    if Pet.exists?(pet)
      if pet.url != ""
        return link_to("#{h(pet.name)}", pet.url)
      else
        return "#{h(pet.name)}"
      end
    else
      return "Unknown"
    end
  end
end
