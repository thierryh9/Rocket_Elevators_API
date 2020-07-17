class CreateDwhquotes < ActiveRecord::Migration[5.2]
  def change
    create_table :dwhquotes do |t|

      t.timestamps
    end
  end
end
