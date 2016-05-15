class ApplyController < ApplicationController
  before_action :set_application_form

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_application_form
    @application_form = FormTemplate.find(params[:id])
    @application_fields = FormField.where(form_template_id: params[:id]).find_each
  end
end