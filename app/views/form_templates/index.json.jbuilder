json.array!(@form_templates) do |form_template|
  json.extract! form_template, :id, :name, :description, :is_letter
  json.url form_template_url(form_template, format: :json)
end
