class AddTitleToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :title, :string
  end
end
