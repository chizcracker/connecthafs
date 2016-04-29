class ChangeTypeInGroups < ActiveRecord::Migration
  def change
    change_column :groups, :type, :string
  end
end
