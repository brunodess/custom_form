class StudentApplication < ActiveRecord::Base
  belongs_to :application_process
  has_many :form_field_inputs
  has_many :letter_requests
end
