module OwnersHelper
  def owner_display(owner)
    if Owner.exists?(owner)
      return link_to("#{h(owner.username)} (##{h(owner.id)})", owner)
    else
      return "Unknown"
    end
  end
end
