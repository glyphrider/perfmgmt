class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @user = User.find(params[:user_id])
  end

  # GET /meetings/new
  def new
    @user = User.find(params[:user_id])
    @meeting = Meeting.new
    mtim = Time.current
    @meeting.time = Time.local(mtim.year,mtim.month,mtim.day,mtim.hour,(mtim.min / 15) * 15)
  end

  # GET /meetings/1/edit
  def edit
    @user = User.find(params[:user_id])
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    subject = User.find(@meeting.user_id)
    if subject.supervisor_id == current_user.id
      respond_to do |format|
        if @meeting.save
          format.html { redirect_to users_url, notice: 'Meeting was successfully created.' }
          format.json { render :show, status: :created, location: @meeting }
        else
          format.html { render :new }
          format.json { render json: @meeting.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { redirect_to users_url, notice: 'Meeting was not valid' }
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to users_url, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
      subject = User.find(@meeting.user_id)
      unless subject.supervisor_id == current_user.id
        @meeting = nil
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:user_id, :time, :notes)
    end
end
