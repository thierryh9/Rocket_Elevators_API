class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :fullName
      t.string :entrepriseName
      t.string :email
      t.string :cellPhone
      t.string :projectName
      t.string :description
      t.references :type, foreign_key: true
      t.string :message
      t.binary :file
      t.date :contactDate

      t.timestamps
    end
  end
end
