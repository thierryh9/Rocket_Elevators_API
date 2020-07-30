class AddAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default:false
	add_column :users, :star_wars, :integer, default:0
  end
end
