class Species < ActiveRecord::Base
  has_many :groups
  has_many :pets
  has_many :females, :class_name => "Pet", :conditions => "gender='Female'"
  has_many :males, :class_name => "Pet", :conditions => "gender='Male'"  
  
  validates_length_of :name, :plural, :group, :in => 3..255
  validates_length_of :prefix, :in => 2..2
  validates_numericality_of :max_members, :max_females, :max_males, :min_females, :min_males
  validates_presence_of :name, :plural, :group, :prefix, :max_members, :max_females, :max_males, :min_females, :min_males
  validates_uniqueness_of :name, :plural, :prefix  
end
