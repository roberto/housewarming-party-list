class ChangeGiverItems < ActiveRecord::Migration
  def self.up
    remove_column :items, :giver
    add_column :items, :giver_id, :integer
  end

  def self.down
    add_column :items, :giver, :string
    remove_column :items, :giver_id
  end
end
