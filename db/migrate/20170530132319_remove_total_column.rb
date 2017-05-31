class RemoveTotalColumn < ActiveRecord::Migration
  def change
    remove_column :votes, :totale
  end
end
