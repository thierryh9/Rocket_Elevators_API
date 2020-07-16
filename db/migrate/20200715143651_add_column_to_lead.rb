class AddColumnToLead < ActiveRecord::Migration[5.2]
  def change
  add_column :leads, :fileName, :string, default:""
  end
end
