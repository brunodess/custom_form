class CreateStudentApplications < ActiveRecord::Migration
  def change
    create_table :student_applications do |t|
      t.string :student_name
      t.integer :application_process_id

      t.timestamps null: false
    end
    add_index :student_applications, :application_process_id
  end
end
