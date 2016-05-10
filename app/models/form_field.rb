class FormField < ActiveRecord::Base
  belongs_to :form_template
  has_many :form_field_inputs
  has_many :form_field_values
  has_many :letter_field_inputs
end
