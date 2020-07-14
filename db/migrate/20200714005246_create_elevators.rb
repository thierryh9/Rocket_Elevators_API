class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :serialNumber
      t.boolean :status
      t.date :serviceDate
      t.date :dateInspection
      t.string :certificat
      t.string :information
      t.string :note
      t.references :column, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
