class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.references :type, foreign_key: true
	  t.string :companyName
      t.string :email
      t.integer :floor
      t.integer :basement
      t.integer :apartment
      t.integer :business
      t.integer :shaft
      t.integer :parking
      t.integer :companie
      t.integer :ocupant
      t.integer :open
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
