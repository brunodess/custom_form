class FormFieldValuesController < ApplicationController
  before_action :set_form_field_value, only: [:show, :edit, :update, :destroy]

  # GET /form_field_values
  # GET /form_field_values.json
  def index
    @form_field_values = FormFieldValue.all
  end

  # GET /form_field_values/1
  # GET /form_field_values/1.json
  def show
  end

  # GET /form_field_values/new
  def new
    @form_field_value = FormFieldValue.new
  end

  # GET /form_field_values/1/edit
  def edit
  end

  # POST /form_field_values
  # POST /form_field_values.json
  def create
    @form_field_value = FormFieldValue.new(form_field_value_params)

    respond_to do |format|
      if @form_field_value.save
        format.html { redirect_to @form_field_value, notice: 'Form field value was successfully created.' }
        format.json { render :show, status: :created, location: @form_field_value }
      else
        format.html { render :new }
        format.json { render json: @form_field_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_field_values/1
  # PATCH/PUT /form_field_values/1.json
  def update
    respond_to do |format|
      if @form_field_value.update(form_field_value_params)
        format.html { redirect_to @form_field_value, notice: 'Form field value was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_field_value }
      else
        format.html { render :edit }
        format.json { render json: @form_field_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_field_values/1
  # DELETE /form_field_values/1.json
  def destroy
    @form_field_value.destroy
    respond_to do |format|
      format.html { redirect_to form_field_values_url, notice: 'Form field value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_field_value
      @form_field_value = FormFieldValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_field_value_params
      params.require(:form_field_value).permit(:form_field_id, :is_default, :value)
    end
end
