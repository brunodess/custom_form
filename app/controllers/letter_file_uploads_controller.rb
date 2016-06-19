
class LetterFileUploadsController < ApplicationController
  before_action :set_letter_file_upload, only: [:destroy]

  def destroy
    @letter_file_upload.destroy
    respond_to do |format|
      format.html { redirect_to form_field_inputs_url, notice: 'Form text input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_letter_file_upload
    @letter_file_upload = LetterFileUpload.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def letter_file_upload_params
    params.require(:letter_file_upload).permit(:letter_request_id, :form_field_id, :file)
  end
end