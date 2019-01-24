class DirectReportsController < ApplicationController
  before_action :set_direct_report, only: [:show, :edit, :update, :destroy]

  # GET /direct_reports
  # GET /direct_reports.json
  def index
    @direct_reports = DirectReport.everybody_with_or_without_a_meeting
  end

  # GET /direct_reports/1
  # GET /direct_reports/1.json
  def show
  end

  # GET /direct_reports/new
  def new
    @direct_report = DirectReport.new
  end

  # GET /direct_reports/1/edit
  def edit
  end

  # POST /direct_reports
  # POST /direct_reports.json
  def create
    @direct_report = DirectReport.new(direct_report_params)

    respond_to do |format|
      if @direct_report.save
        format.html { redirect_to direct_reports_url, notice: 'Direct report was successfully created.' }
        format.json { render :show, status: :created, location: @direct_report }
      else
        format.html { render :new }
        format.json { render json: @direct_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /direct_reports/1
  # PATCH/PUT /direct_reports/1.json
  def update
    respond_to do |format|
      if @direct_report.update(direct_report_params)
        format.html { redirect_to @direct_report, notice: 'Direct report was successfully updated.' }
        format.json { render :show, status: :ok, location: @direct_report }
      else
        format.html { render :edit }
        format.json { render json: @direct_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /direct_reports/1
  # DELETE /direct_reports/1.json
  def destroy
    @direct_report.destroy
    respond_to do |format|
      format.html { redirect_to direct_reports_url, notice: 'Direct report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direct_report
      @direct_report = DirectReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def direct_report_params
      params.require(:direct_report).permit(:name)
    end
end
