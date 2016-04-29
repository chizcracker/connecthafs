class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups, id: :uuid do |t|
      t.string :name
      t.string :address
      t.integer :type

      t.timestamps null: false
    end
  end
end
