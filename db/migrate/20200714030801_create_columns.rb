class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.integer :numberFloor
      t.boolean :status
      t.text :information
      t.text :note
      t.references :battery, foreign_key: true

      t.timestamps
    end
  end
end
