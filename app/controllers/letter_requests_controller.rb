class LetterRequestsController < ApplicationController
  before_action :set_letter_request, only: [:show, :edit, :update, :destroy]

  # GET /letter_requests
  # GET /letter_requests.json
  def index
    @letter_requests = LetterRequest.all
  end

  # GET /letter_requests/1
  # GET /letter_requests/1.json
  def show
  end

  # GET /letter_requests/new
  def new
    @letter_request = LetterRequest.new
  end

  # GET /letter_requests/1/edit
  def edit
  end

  def fill
    @letter_request = LetterRequest.find_by_access_code(params[:access_code])
    if !@letter_request.is_filled?
      @letter_fields = FormField.where(form_template_id: @letter_request.student_application.application_process.letter_template_id).where.not(field_type: ['text', 'file'])
      @letter_texts = FormField.where(form_template_id: @letter_request.student_application.application_process.letter_template_id, field_type: 'text' )
      @letter_files = FormField.where(form_template_id: @letter_request.student_application.application_process.letter_template_id, field_type: 'file' )

      @letter_fields.each do |field|
        @letter_request.letter_field_inputs.new(form_field_id: field.id)
      end

      @letter_texts.each do |text|
        @letter_request.letter_text_inputs.new(form_field_id: text.id)
      end

      @letter_files.each do |file|
        @letter_request.letter_file_uploads.new(form_field_id: file.id)
      end
    else
      redirect_to @letter_request, notice: 'Letter already filled.'
    end

  end

  # POST /letter_requests
  # POST /letter_requests.json
  def create
    @letter_request = LetterRequest.new(letter_request_params)

    respond_to do |format|
      if @letter_request.save

        format.html { redirect_to @letter_request, notice: 'Letter request was successfully created.' }
        format.json { render :show, status: :created, location: @letter_request }
      else
        format.html { render :new }
        format.json { render json: @letter_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letter_requests/1
  # PATCH/PUT /letter_requests/1.json
  def update
    respond_to do |format|
      if @letter_request.update(letter_request_params)
        format.html { redirect_to @letter_request, notice: 'Letter request was successfully updated.' }
        format.json { render :show, status: :ok, location: @letter_request }
      else
        format.html { render :edit }
        format.json { render json: @letter_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letter_requests/1
  # DELETE /letter_requests/1.json
  def destroy
    @letter_request.destroy
    respond_to do |format|
      format.html { redirect_to letter_requests_url, notice: 'Letter request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter_request
      @letter_request = LetterRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_request_params
      params.require(:letter_request).permit(:professor_email, :student_application_id, :access_code, :is_filled,
                                             letter_field_inputs_attributes: [:form_field_id, :input, :_destroy],
                                             letter_text_inputs_attributes: [:id, :letter_request_id, :form_field_id, :input, :_destroy],
                                             letter_file_uploads_attributes:[:id, :letter_request_id, :form_field_id, :file, :_destroy],
      )
    end
end
