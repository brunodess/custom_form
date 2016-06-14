class FormTextInputsController < ApplicationController
  before_action :set_form_text_input, only: [:destroy]

  def destroy
    @form_text_input.destroy
    respond_to do |format|
      format.html { redirect_to form_field_inputs_url, notice: 'Form text input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_text_input
      @form_text_input = FormTextInput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_text_input_params
      params.require(:form_text_input).permit(:student_application_id, :form_field_id, :input)
    end
end
