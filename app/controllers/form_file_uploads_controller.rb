class FormFileUploadsController < ApplicationController
  before_action :set_form_file_upload, only: [:destroy]

  def destroy
    @form_file_upload.destroy
    respond_to do |format|
      format.html { redirect_to form_field_inputs_url, notice: 'Form text input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_form_file_upload
    @form_file_upload = FormFileUpload.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def form_file_upload_params
    params.require(:form_file_upload).permit(:student_application_id, :form_field_id, :file)
  end
end