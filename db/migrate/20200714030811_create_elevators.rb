class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :serialNumber
      t.boolean :status
      t.boolean :intervention
      t.date :inspectionDate
	  t.date :installDate
      t.string :certificat
      t.text :information
      t.text :note
	  t.references :type, foreign_key: true
      t.references :column, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
