module Admin::GroupsHelper
  def select_owner
    Owner.find(:all, :order => "username ASC").map {|owner| [owner.username, owner.id]}
  end
  
  def select_group_leader
    Pet.find(:all, :order => "name ASC").map {|pet| [pet.name, pet.id]}
  end
  
  def select_species
    Species.find(:all, :order => "name ASC").map {|species| [species.name, species.id]}
  end
end
