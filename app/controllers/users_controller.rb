require 'redcarpet'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:create, :destroy]

  # GET /users
  # GET /users.json
  def index
    if current_user.admin?
      @users = User.all_users_with_or_without_a_meeting
    else
      @users = User.all_reports_with_or_without_a_meeting(current_user)
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  end

  # GET /users/new
  def new
    @user = User.new
    @user.supervisor_id = current_user.id
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      unless current_user.admin? || @user.supervisor == current_user
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'Direct report was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Direct report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def redirect
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name,:github_id,:supervisor_id)
    end
end
