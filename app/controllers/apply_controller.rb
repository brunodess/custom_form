class ApplyController < ApplicationController

  def index
    @application_process = ApplicationProcess.all
  end

  def new
    @application_process = ApplicationProcess.find(params[:application_process_id])
    @application_form = FormTemplate.find(@application_process.form_template_id)
    @application_letter = FormTemplate.find(@application_process.letter_template_id)
    @application_fields = FormField.where(form_template_id: @application_form.id).where.not(field_type: ['text', 'file'])
    @application_texts = FormField.where(form_template_id: @application_form.id, field_type: 'text')
    @application_files = FormField.where(form_template_id: @application_form.id, field_type: 'file')

    @apply = StudentApplication.new

    @application_fields.each do |field|
      @apply.form_field_inputs.new(form_field_id: field.id)
    end

    @application_texts.each do |text|
      @apply.form_text_inputs.new(form_field_id: text.id)
    end

    @application_files.each do |file|
      @apply.form_file_uploads.new(form_field_id: file.id)
    end

    @application_process.min_letters.to_i.times do |x|
      @apply.letter_requests.new
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.


end