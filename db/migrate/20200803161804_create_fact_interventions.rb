class CreateFactInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
      t.integer :employeeID
      t.integer :buildingID
      t.integer :batteryID
      t.integer :columnID
      t.integer :elevatorID
      t.datetime :interventionStart
      t.datetime :interventionEnd
      t.string :result
      t.string :repport
      t.string :statut

      t.timestamps
    end
  end
end
