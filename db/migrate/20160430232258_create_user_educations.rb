class CreateUserEducations < ActiveRecord::Migration
  def change
    create_table :user_educations do |t|
      t.date :attended_from
      t.date :attended_to
      t.string :field
      t.string :grade
      t.text :activities
      t.text :description

      t.timestamps null: false
    end

    add_reference :user_educations, :user, type: :uuid, index: true
    add_foreign_key :user_educations, :users, column: :user_id

    add_reference :user_educations, :education, references: :groups, type: :uuid, index: true
    add_foreign_key :user_educations, :groups, column: :education_id
  end
end
