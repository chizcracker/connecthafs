class ChangeClassInUser < ActiveRecord::Migration
  def change
    rename_column :users, :class, :class_year
  end
end
