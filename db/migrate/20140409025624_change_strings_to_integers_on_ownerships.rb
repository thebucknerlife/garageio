class ChangeStringsToIntegersOnOwnerships < ActiveRecord::Migration
  def change
    change_column :ownerships, :user_id, :integer
    change_column :ownerships, :car_id, :integer
  end
end
