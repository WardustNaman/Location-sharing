class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.integer :status_id
      t.string :x_axis
      t.string :y_axis

      t.timestamps
    end
  end
end
