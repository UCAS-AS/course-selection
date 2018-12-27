class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string    :sno
      t.string    :name
      t.string    :email
      t.string    :gender
      t.datetime  :enrolled_date
      t.datetime  :birth_date
      t.string    :degree
      t.string    :major
      t.string    :phone
      t.string    :password_digest
      t.string    :reset_digest
      t.datetime  :reset_sent_at
      t.string    :remember_digest
      t.boolean   :email_activated, default: false
      t.string    :email_activation_digest
      t.datetime  :email_activated_sent_at
      t.references :department, forein_key: true

      t.timestamps
    end

    add_index :students, :sno, unique:true
    add_index :students, :email, unique:true
  end
end
