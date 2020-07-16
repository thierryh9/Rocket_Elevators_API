class AddLimitToLeads < ActiveRecord::Migration[5.2]
  def change
  change_column :leads, :file, :binary, :limit => 10.megabyte
  end
end
