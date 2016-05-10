class CreateFormTemplates < ActiveRecord::Migration
  def change
    create_table :form_templates do |t|
      t.string :name
      t.text :description
      t.boolean :is_letter

      t.timestamps null: false
    end
  end
end
