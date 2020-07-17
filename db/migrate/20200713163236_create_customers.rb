class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :entrepriseName
      t.string :nameContact
      t.string :cellPhone
      t.string :email
      t.string :description
      t.string :authorityName
      t.string :authorityPhone
      t.string :authorityEmail
      t.references :user, foreign_key: true
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
