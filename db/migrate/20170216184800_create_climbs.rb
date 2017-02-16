class CreateClimbs < ActiveRecord::Migration
  def change
    create_table :climbs do |t|
      t.string  :name
      t.string  :grade
      t.string  :description
      t.integer :user_id
      t.integer :location_id
      t.timestamps null: false
    end
  end
end
