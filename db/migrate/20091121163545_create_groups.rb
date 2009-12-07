class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name, :length => 150
      t.integer :leader_id, :default => 0, :references => :pets
      t.string :url, :default => nil
      t.integer :flags, :default => 0
      t.integer :species_id, :default => 0, :references => :species
      t.integer :owner_id, :default => 0, :references => :owners

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
