class AddDescriptionToFormFields < ActiveRecord::Migration
  def change
    add_column :form_fields, :description, :text
  end
end
