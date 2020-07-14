class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.integer :numberFloor
      t.boolean :status
      t.string :information
      t.string :note
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
