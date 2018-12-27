class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :cno
      t.string :title
      t.integer :year
      t.string :semester
      t.integer :credit
      t.integer :start_week
      t.integer :end_week
      t.integer :select_limit
      t.integer :hours
      t.string :week_time_classroom
      t.string :course_type
      t.text :brief
      t.references :department, forein_key: true

      t.timestamps
    end

    add_index :courses, :cno, unique:true
  end
end
