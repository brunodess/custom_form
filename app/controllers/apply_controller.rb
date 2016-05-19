class ApplyController < ApplicationController
  before_action :set_application_form, only: [:show, :edit, :update, :destroy]

  def index
    @application_process = ApplicationProcess.all
  end

  def new
    @application_process = ApplicationProcess.find(params[:application_process_id])
    @application_form = FormTemplate.find(@application_process.form_template_id)
    @application_letter = FormTemplate.find(@application_process.letter_template_id)
    @application_fields = FormField.where(form_template_id: @application_form.id)

    @apply = StudentApplication.new

    @application_fields.each do |field|
      @apply.form_field_inputs.new(form_field_id: field.id)
    end

    @application_process.total_letters.to_i.times do |x|
      @apply.letter_requests.new
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_application_form
    @application_process = ApplicationProcess.find(params[:id])
    @application_form = FormTemplate.find(@application_process.form_template_id)
    @application_fields = FormField.where(form_template_id: @application_form.id).find_each
  end

  def apply_params
    params.permit(:student_name, :application_process_id,
                                                form_field_inputs_attributes:[:id, :input, :form_field_id, :_destroy])
  end
end