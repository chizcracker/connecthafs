class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :phonenumber
      t.integer  :class
      t.string :address
      t.timestamps null: false
    end
  end
end
