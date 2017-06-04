class RemoveTotalColumn < ActiveRecord::Migration
  def change
    remove_column :votes, :total
  end
end
