class StudentApplication < ActiveRecord::Base
  belongs_to :application_process
  has_many :form_field_inputs
  has_many :letter_requests

  accepts_nested_attributes_for :form_field_inputs,
                                allow_destroy: true
  accepts_nested_attributes_for :letter_requests,
                                allow_destroy: true
end
