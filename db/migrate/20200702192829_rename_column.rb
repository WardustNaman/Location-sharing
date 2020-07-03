class RenameColumn < ActiveRecord::Migration[6.0]
  def change
  	rename_column :users_locations, :loaction_id, :location_id
  end
end
