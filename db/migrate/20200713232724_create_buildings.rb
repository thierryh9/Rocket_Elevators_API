class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :fullName
      t.string :email
      t.string :cellPhone
      t.string :techName
      t.string :techPhone
      t.string :techEmail
      t.references :address, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
