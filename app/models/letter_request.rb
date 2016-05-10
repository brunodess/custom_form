class LetterRequest < ActiveRecord::Base
  has_many :letter_field_inputs
  belongs_to :student_application
end
