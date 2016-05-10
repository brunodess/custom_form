json.array!(@form_field_inputs) do |form_field_input|
  json.extract! form_field_input, :id, :student_application_id, :form_field_id, :input
  json.url form_field_input_url(form_field_input, format: :json)
end
