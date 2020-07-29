class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :aType
      t.string :status
      t.string :entity
      t.string :street
      t.string :suite
      t.string :city
      t.string :postalCode
      t.string :country
      t.string :notes
	  t.float :lat
	  t.float :long

      t.timestamps
    end
  end
end
