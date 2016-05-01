class CreateUserWorks < ActiveRecord::Migration
  def change
    create_table :user_works do |t|
      t.string :location
      t.string :team
      t.string :title
      t.date :work_start
      t.date :work_end
      t.text :description

      t.timestamps null: false
    end

    add_reference :user_works, :user, type: :uuid, index: true
    add_foreign_key :user_works, :users, column: :user_id

    add_reference :user_works, :work, references: :groups, type: :uuid, index: true
    add_foreign_key :user_works, :groups, column: :work_id
  end
end
