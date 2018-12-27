class CreateTeachRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :teach_relationships do |t|
      t.integer :teacher_id
      t.integer :course_id

      t.timestamps
    end

    add_index :teach_relationships, :teacher_id
    add_index :teach_relationships, :course_id
    add_index :teach_relationships, [:teacher_id, :course_id], unique: true
  end
end
