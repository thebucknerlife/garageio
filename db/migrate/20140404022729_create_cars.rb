class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :car_model
      t.integer :year

      t.timestamps
    end
  end
end
