class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.string :infoKey
      t.string :infoValue
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
