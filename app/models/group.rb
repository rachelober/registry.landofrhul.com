class Group < ActiveRecord::Base
  has_many :pets
  belongs_to :leader, :class_name => 'Pet', :foreign_key => 'leader_id'
  belongs_to :owner
  belongs_to :pet
  belongs_to :species
  
  has_flags [ :open_joining, :open_breeding ], [ :column => :flags ]
  
  validates_length_of :name, :url, :in => 5..255
  validates_numericality_of :leader_id, :species_id, :owner_id
  validates_presence_of :name, :url, :leader_id, :species_id, :owner_id
  validates_uniqueness_of :name, :scope => "species_id"
end
