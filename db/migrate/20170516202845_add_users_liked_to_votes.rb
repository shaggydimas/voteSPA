class AddUsersLikedToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :users_liked, :string, :default => "[]"
  end
end
