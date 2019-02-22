class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    if current_user.admin?
      @reviews = Review.all
    else
      @reviews = Review.find_all_by_author_id(current_user.id)
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
    author = current_user
    @review.author = author
  end

  # GET /reviews/1/edit
  def edit
    @user = User.find(params[:user_id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.author = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to reviews_url, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to reviews_url, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
      subject = User.find(@review.subject_id)
      unless subject.supervisor == current_user || review.author == current_user
        @review = nil
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:subject_id,:engagement_score,:engagement_notes,:collaboration_score,:collaboration_notes,:curiosity_score,:curiosity_notes,:comfort_zone_score,:comfort_zone_notes,:teaming_score,:teaming_notes,:dissertation_score,:dissertation_notes,:concepts_score,:concepts_notes,:practices_score,:practices_notes,:notes)
    end
end
