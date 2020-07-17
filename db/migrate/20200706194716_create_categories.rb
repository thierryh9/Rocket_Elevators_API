class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.decimal :price
      t.decimal :frais

      t.timestamps
    end
  end
end
