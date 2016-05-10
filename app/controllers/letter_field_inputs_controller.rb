class LetterFieldInputsController < ApplicationController
  before_action :set_letter_field_input, only: [:show, :edit, :update, :destroy]

  # GET /letter_field_inputs
  # GET /letter_field_inputs.json
  def index
    @letter_field_inputs = LetterFieldInput.all
  end

  # GET /letter_field_inputs/1
  # GET /letter_field_inputs/1.json
  def show
  end

  # GET /letter_field_inputs/new
  def new
    @letter_field_input = LetterFieldInput.new
  end

  # GET /letter_field_inputs/1/edit
  def edit
  end

  # POST /letter_field_inputs
  # POST /letter_field_inputs.json
  def create
    @letter_field_input = LetterFieldInput.new(letter_field_input_params)

    respond_to do |format|
      if @letter_field_input.save
        format.html { redirect_to @letter_field_input, notice: 'Letter field input was successfully created.' }
        format.json { render :show, status: :created, location: @letter_field_input }
      else
        format.html { render :new }
        format.json { render json: @letter_field_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letter_field_inputs/1
  # PATCH/PUT /letter_field_inputs/1.json
  def update
    respond_to do |format|
      if @letter_field_input.update(letter_field_input_params)
        format.html { redirect_to @letter_field_input, notice: 'Letter field input was successfully updated.' }
        format.json { render :show, status: :ok, location: @letter_field_input }
      else
        format.html { render :edit }
        format.json { render json: @letter_field_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letter_field_inputs/1
  # DELETE /letter_field_inputs/1.json
  def destroy
    @letter_field_input.destroy
    respond_to do |format|
      format.html { redirect_to letter_field_inputs_url, notice: 'Letter field input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter_field_input
      @letter_field_input = LetterFieldInput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_field_input_params
      params.require(:letter_field_input).permit(:letter_request_id, :form_field_id, :input)
    end
end
