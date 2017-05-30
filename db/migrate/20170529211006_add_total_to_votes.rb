class AddTotalToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :total, :integer, :default => 0
  end
end
