class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.string :user_id
      t.string :car_id

      t.timestamps
    end
  end
end
