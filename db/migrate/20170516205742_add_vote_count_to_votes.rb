class AddVoteCountToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :vote_count, :string, :default => "{}"
  end
end
