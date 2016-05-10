json.array!(@form_fields) do |form_field|
  json.extract! form_field, :id, :field_type, :name, :form_template_id, :is_mandatory, :default
  json.url form_field_url(form_field, format: :json)
end
