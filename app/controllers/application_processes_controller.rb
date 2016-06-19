class ApplicationProcessesController < ApplicationController
  before_action :set_application_process, only: [:show, :edit, :update, :destroy]

  # GET /application_processes
  # GET /application_processes.json
  def index
    @application_processes = ApplicationProcess.all
  end

  # GET /application_processes/1
  # GET /application_processes/1.json
  def show
  end

  # GET /application_processes/new
  def new
    @application_process = ApplicationProcess.new
  end

  # GET /application_processes/1/edit
  def edit
  end

  # POST /application_processes
  # POST /application_processes.json
  def create
    @application_process = ApplicationProcess.new(application_process_params)

    respond_to do |format|
      if @application_process.save
        format.html { redirect_to @application_process, notice: 'Application process was successfully created.' }
        format.json { render :show, status: :created, location: @application_process }
      else
        format.html { render :new }
        format.json { render json: @application_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /application_processes/1
  # PATCH/PUT /application_processes/1.json
  def update
    respond_to do |format|
      if @application_process.update(application_process_params)
        format.html { redirect_to @application_process, notice: 'Application process was successfully updated.' }
        format.json { render :show, status: :ok, location: @application_process }
      else
        format.html { render :edit }
        format.json { render json: @application_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_processes/1
  # DELETE /application_processes/1.json
  def destroy
    @application_process.destroy
    respond_to do |format|
      format.html { redirect_to application_processes_url, notice: 'Application process was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_process
      @application_process = ApplicationProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_process_params
      params.require(:application_process).permit(:name, :semester, :year, :start_date, :end_date, :form_template_id, :letter_template_id, :max_letters, :min_letters, student_applications_attributes: [:id, :name])
    end
end
