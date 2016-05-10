json.array!(@student_applications) do |student_application|
  json.extract! student_application, :id, :student_name, :application_process_id
  json.url student_application_url(student_application, format: :json)
end
