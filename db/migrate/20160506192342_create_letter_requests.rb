class CreateLetterRequests < ActiveRecord::Migration
  def change
    create_table :letter_requests do |t|
      t.string :professor_email
      t.integer :student_application_id
      t.string :access_code

      t.timestamps null: false
    end
    add_index :letter_requests, :student_application_id
  end
end
