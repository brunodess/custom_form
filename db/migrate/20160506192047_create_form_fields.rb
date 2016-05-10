class CreateFormFields < ActiveRecord::Migration
  def change
    create_table :form_fields do |t|
      t.string :field_type
      t.string :name
      t.integer :form_template_id
      t.boolean :is_mandatory
      t.string :default

      t.timestamps null: false
    end
    add_index :form_fields, :form_template_id
  end
end
