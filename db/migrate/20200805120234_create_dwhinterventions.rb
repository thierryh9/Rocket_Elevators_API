class CreateDwhinterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :dwhinterventions do |t|
      t.integer :employeeID
      t.integer :buildingID
      t.integer :batteryID
      t.integer :columnID
      t.integer :elevatorID
      t.datetime :interventionStartDate
      t.datetime :interventionEndDate
      t.string :result
      t.string :repport
      t.string :statut

      t.timestamps
    end
  end
end
