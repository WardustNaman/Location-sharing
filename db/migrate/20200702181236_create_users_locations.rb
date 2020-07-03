class CreateUsersLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :users_locations do |t|
      t.string :loaction_id
      t.string :user_id

      t.timestamps
    end
  end
end
