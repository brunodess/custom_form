class StudentApplicationsController < ApplicationController
  before_action :set_student_application, only: [:show, :edit, :update, :destroy]

  # GET /student_applications
  # GET /student_applications.json
  def index
    @student_applications = StudentApplication.all
  end

  # GET /student_applications/1
  # GET /student_applications/1.json
  def show
  end

  # GET /student_applications/new
  def new
    @student_application = StudentApplication.new
  end

  # GET /student_applications/1/edit
  def edit
  end

  # POST /student_applications
  # POST /student_applications.json
  def create
    @student_application = StudentApplication.new(student_application_params)
    @student_application.letter_requests.each do |lr|
      lr.class
    end

    respond_to do |format|
      if @student_application.save
        @student_application.letter_requests.each do |lr|
          ApplyMailer.letter_request_mail(lr).deliver_later
        end
        format.html { redirect_to @student_application, notice: 'Student application was successfully created.' }
        format.json { render :show, status: :created, location: @student_application }
      else
        format.html { render :new }
        format.json { render json: @student_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_applications/1
  # PATCH/PUT /student_applications/1.json
  def update
    respond_to do |format|
      if @student_application.update(student_application_params)
        format.html { redirect_to @student_application, notice: 'Student application was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_application }
      else
        format.html { render :edit }
        format.json { render json: @student_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_applications/1
  # DELETE /student_applications/1.json
  def destroy
    @student_application.destroy
    respond_to do |format|
      format.html { redirect_to student_applications_url, notice: 'Student application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_application
      @student_application = StudentApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_application_params
      params.require(:student_application).permit(:student_name, :application_process_id,
                                                  form_field_inputs_attributes:[:id, :form_field_id, :input, :_destroy],
                                                  form_text_inputs_attributes:[:id, :form_field_id, :input, :_destroy],
                                                  form_file_uploads_attributes:[:id, :student_application_id, :form_field_id, :file, :_destroy],
                                                  letter_requests_attributes:[:id, :professor_email, :student_application_id, :access_code, :is_filled, :_destroy]
      )
    end
end
