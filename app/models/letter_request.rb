class LetterRequest < ActiveRecord::Base
  has_many :letter_field_inputs, :dependent => :delete_all
  has_many :letter_text_inputs, :dependent => :delete_all
  belongs_to :student_application

  validates :professor_email, :access_code, presence: true
  validates :access_code, uniqueness: true

  accepts_nested_attributes_for :letter_field_inputs,
                                allow_destroy: true
  accepts_nested_attributes_for :letter_text_inputs,
                                allow_destroy: true

  def generate_access_code
    token = SecureRandom.urlsafe_base64
    while LetterRequest.exists?(access_code: token)
      token = SecureRandom.urlsafe_base64
    end
    return token
  end

end
