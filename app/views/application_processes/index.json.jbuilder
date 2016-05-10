json.array!(@application_processes) do |application_process|
  json.extract! application_process, :id, :name, :semester, :year, :start_date, :end_date, :form_template_id, :letter_template_id, :total_letters
  json.url application_process_url(application_process, format: :json)
end
