class CreateSelectRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :select_relationships do |t|
      t.string :student_id
      t.string :course_id
      t.boolean :is_degree_course, default: false
      t.integer :grade
      t.timestamps
    end

    add_index :select_relationships, :student_id
    add_index :select_relationships, :course_id
    add_index :select_relationships, [:student_id, :course_id], unique: true
  end
end
