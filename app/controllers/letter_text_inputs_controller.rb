class LetterTextInputsController
  before_action :set_letter_text_input, only: [:destroy]

  def destroy
    @letter_text_input.destroy
    respond_to do |format|
      format.html { redirect_to form_field_inputs_url, notice: 'Form text input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_letter_text_input
    @letter_text_input = LetterTextInput.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def letter_text_input_params
    params.require(:letter_text_input).permit(:letter_request_id, :form_field_id, :input)
  end
end