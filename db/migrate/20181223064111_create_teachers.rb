class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :tno
      t.string :email
      t.string :gender
      t.string :phone
      t.string :name
      t.string :title
      t.datetime :birth_date
      t.string :password_digest
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.string :remember_digest
      t.string :email_activation_digest
      t.boolean :email_activated
      t.datetime :email_activated_sent_at
      t.references :department, forein_key: true

      t.timestamps
    end

    add_index :teachers, :tno, unique:true
    add_index :teachers, :email, unique:true
  end
end
