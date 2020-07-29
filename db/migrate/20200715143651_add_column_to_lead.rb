class AddColumnToLead < ActiveRecord::Migration[5.2]
  def change
  add_column :leads, :fileName, :string, default:""
  add_column :leads, :shareLink, :string, default:""
  end
end
