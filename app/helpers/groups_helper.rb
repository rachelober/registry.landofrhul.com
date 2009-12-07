module GroupsHelper
  def group_name(group)
    if Group.exists?(group)
      return link_to("#{h(group.species.group)} of #{h(group.name)}", group)
    else
      return "Unknown"
    end
  end
end
