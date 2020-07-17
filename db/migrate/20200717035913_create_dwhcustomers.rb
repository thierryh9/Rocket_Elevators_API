class CreateDwhcustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dwhcustomers do |t|

      t.timestamps
    end
  end
end
