class Pet < ActiveRecord::Base
  belongs_to :dam, :class_name => 'Pet', :foreign_key => 'dam_id'
  belongs_to :sire, :class_name => 'Pet', :foreign_key => 'sire_id'
  belongs_to :owner
  belongs_to :species
  belongs_to :group
  belongs_to :birth_group, :class_name => 'Group', :foreign_key => 'group_birth_id'
  
  has_flags [ :broken_url, :page_errors, :no_link ], [ :column => :flags ]
  
  validates_inclusion_of :gender, :in => %w{ "Male", "Female" }, :message => "should be 'male' or 'female'"
  validates_length_of :name, :age, :gender, :url, :genetics, :in => 5..255
  validates_numericality_of :regid, :dam_id, :sire_id, :group_id, :group_birth_id, :species_id, :owner_id
  validates_presence_of :regid, :name, :age, :gender, :dam_id, :sire_id, :species_id
  validates_uniqueness_of :regid, :name, :scope => "species_id"
  
  def reg
    return "#{self.species.prefix}#{self.regid}#{self.gender.downcase.slice(0..0)}"
  end
  
  def self.find_by_reg()
    prefix = reg.slice(0..1)
    id = reg.slice(2..4)
    species = Species.find_by_prefix(prefix)
    return pet = Pet.find(id, :conditions => ['species_id = ?', species])
  end
end
