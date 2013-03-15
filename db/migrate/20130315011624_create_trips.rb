class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :trip_type_id

      t.timestamps
    end
  end
end
