class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string  :name
      t.string  :city
      t.string  :state
      t.timestamps null: false
    end
  end
end
