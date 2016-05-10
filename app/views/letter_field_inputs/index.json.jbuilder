json.array!(@letter_field_inputs) do |letter_field_input|
  json.extract! letter_field_input, :id, :letter_request_id, :form_field_id, :input
  json.url letter_field_input_url(letter_field_input, format: :json)
end
