class CreatePets < ActiveRecord::Migration
  def self.up
    create_table :pets do |t|
      t.string :regid, :length => 3
      t.string :name, :length => 150
      t.integer :age, :default => 0
      t.string :gender, :length => 1
      t.string :url, :default => nil
      t.integer :dam_id, :default => 0, :references => :pets
      t.integer :sire_id, :default => 0, :references => :pets
      t.string :genetics, :default => nil
      t.text :notes, :default => nil
      t.integer :flags, :default => 0
      t.integer :group_id, :default => 0, :references => :groups
      t.integer :group_birth_id, :default => 0, :references => :groups
      t.integer :species_id, :default => 0, :references => :species
      t.integer :owner_id, :default => 0, :references => :owners

      t.timestamps
    end
  end

  def self.down
    drop_table :pets
  end
end
