class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.date :inspectionDate
	  t.date :installDate
      t.boolean :status
	  t.text :information
      t.text :note
      t.references :type, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
