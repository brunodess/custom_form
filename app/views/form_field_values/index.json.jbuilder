json.array!(@form_field_values) do |form_field_value|
  json.extract! form_field_value, :id, :form_field_id, :is_default, :value
  json.url form_field_value_url(form_field_value, format: :json)
end
