json.array!(@letter_requests) do |letter_request|
  json.extract! letter_request, :id, :professor_email, :student_application_id, :access_code
  json.url letter_request_url(letter_request, format: :json)
end
