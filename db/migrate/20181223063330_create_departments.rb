class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :dno
      t.string :name

      t.timestamps
    end

    add_index :departments, :dno, unique: true
  end
end
