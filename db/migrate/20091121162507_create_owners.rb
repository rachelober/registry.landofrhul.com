class CreateOwners < ActiveRecord::Migration
  def self.up
    create_table :owners do |t|
      t.string :username, :length => 150
      t.string :email, :length => 150
      t.string :url, :default => nil
      t.integer :flags, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :owners
  end
end
