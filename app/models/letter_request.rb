class LetterRequest < ActiveRecord::Base
  has_many :letter_field_inputs
  belongs_to :student_application

  def generate_access_code
    token = SecureRandom.urlsafe_base64
    while LetterRequest.exists?(access_code: token)
      token = SecureRandom.urlsafe_base64
    end
    return token
  end

end
