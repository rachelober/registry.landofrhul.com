class Owner < ActiveRecord::Base
  has_many :groups
  has_many :pets
  
  has_flags [ :email_private, :banned ], [ :column => :flags ]
  
  validates_email_format_of :email
  validates_length_of :email, :username, :url, :in => 5..255
  validates_numericality_of :flags
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  
  def find_pets_by_species(species)
    return Pet.find(:all, :conditions => ['owner_id = ? AND species_id = ?', self.id, species.id], :order => "name ASC")
  end
end
