class FormFieldInputsController < ApplicationController
  before_action :set_form_field_input, only: [:show, :edit, :update, :destroy]

  # GET /form_field_inputs
  # GET /form_field_inputs.json
  def index
    @form_field_inputs = FormFieldInput.all
  end

  # GET /form_field_inputs/1
  # GET /form_field_inputs/1.json
  def show
  end

  # GET /form_field_inputs/new
  def new
    @form_field_input = FormFieldInput.new
  end

  # GET /form_field_inputs/1/edit
  def edit
  end

  # POST /form_field_inputs
  # POST /form_field_inputs.json
  def create
    @form_field_input = FormFieldInput.new(form_field_input_params)

    respond_to do |format|
      if @form_field_input.save
        format.html { redirect_to @form_field_input, notice: 'Form field input was successfully created.' }
        format.json { render :show, status: :created, location: @form_field_input }
      else
        format.html { render :new }
        format.json { render json: @form_field_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_field_inputs/1
  # PATCH/PUT /form_field_inputs/1.json
  def update
    respond_to do |format|
      if @form_field_input.update(form_field_input_params)
        format.html { redirect_to @form_field_input, notice: 'Form field input was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_field_input }
      else
        format.html { render :edit }
        format.json { render json: @form_field_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_field_inputs/1
  # DELETE /form_field_inputs/1.json
  def destroy
    @form_field_input.destroy
    respond_to do |format|
      format.html { redirect_to form_field_inputs_url, notice: 'Form field input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_field_input
      @form_field_input = FormFieldInput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_field_input_params
      params.require(:form_field_input).permit(:student_application_id, :form_field_id, :input)
    end
end
