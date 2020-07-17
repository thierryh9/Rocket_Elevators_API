class CreateDwhleads < ActiveRecord::Migration[5.2]
  def change
    create_table :dwhleads do |t|

      t.timestamps
    end
  end
end
