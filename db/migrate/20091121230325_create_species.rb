class CreateSpecies < ActiveRecord::Migration
  def self.up
    create_table :species do |t|
      t.string :name, :length => 150
      t.string :plural, :length => 150
      t.string :group, :length => 150
      t.string :prefix, :length => 2
      t.string :stages, :default => nil
      t.integer :flags, :default => 0
      t.integer :max_members, :default => 0
      t.integer :max_females, :default => 0
      t.integer :max_males, :default => 0
      t.integer :min_females, :default => 0
      t.integer :min_males, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :species
  end
end
