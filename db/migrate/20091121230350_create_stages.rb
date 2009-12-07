class CreateStages < ActiveRecord::Migration
  def self.up
    create_table :stages do |t|
      t.string :name, :length => 150

      t.timestamps
    end
  end

  def self.down
    drop_table :stages
  end
end
