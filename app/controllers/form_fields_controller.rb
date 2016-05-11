class FormFieldsController < ApplicationController
  before_action :set_form_field, only: [:show, :edit, :update, :destroy]

  # GET /form_fields
  # GET /form_fields.json
  def index
    @form_fields = FormField.all
  end

  # GET /form_fields/1
  # GET /form_fields/1.json
  def show
  end

  # GET /form_fields/new
  def new
    @form_field = FormField.new
  end

  # GET /form_fields/1/edit
  def edit
  end

  # POST /form_fields
  # POST /form_fields.json
  def create
    @form_field = FormField.new(form_field_params)

    respond_to do |format|
      if @form_field.save
        format.html { redirect_to @form_field, notice: 'Form field was successfully created.' }
        format.json { render :show, status: :created, location: @form_field }
      else
        format.html { render :new }
        format.json { render json: @form_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_fields/1
  # PATCH/PUT /form_fields/1.json
  def update
    respond_to do |format|
      if @form_field.update(form_field_params)
        format.html { redirect_to @form_field, notice: 'Form field was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_field }
      else
        format.html { render :edit }
        format.json { render json: @form_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_fields/1
  # DELETE /form_fields/1.json
  def destroy
    @form_field.destroy
    respond_to do |format|
      format.html { redirect_to form_fields_url, notice: 'Form field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_field
      @form_field = FormField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_field_params
      params.require(:form_field).permit(:field_type, :name, :form_template_id, :is_mandatory, :default, form_field_values_attributes: [:id, :is_default, :value, :_destroy])
    end

end
