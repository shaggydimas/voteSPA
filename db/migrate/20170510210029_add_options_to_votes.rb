class AddOptionsToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :options, :string
  end
end
