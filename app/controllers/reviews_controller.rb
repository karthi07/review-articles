class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :articles_data, :add_review]
  
  # GET /reviews
  # GET /reviews.json
  def index
    @review = Review.new
    if user_signed_in?
      @reviews = Review.where(user: current_user.following_list + [current_user] ).ordered_by_most_recent
      @users = current_user.tob_followed.take(3)
    else
      @reviews = Review.all.ordered_by_most_recent
    end
  end

  def api_articles
    format.json { render :show, status: :created, location: @review }
  end

  def add_review
    # logger.info(params[:review])
    # byebug
    @review = current_user.reviews.build(content: params[:review],article_title: params[:title],article_link: params[:link])
    if @review.save
      render json: [], status: :ok
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def get_articles
    @users = current_user.tob_followed.take(3)
    render 'articles'
  end

  def articles_data
    redis = Redis.new(host: "localhost", port: 6379, db: 0)
    articles_json = redis.get("articles")
    render json: articles_json, status: :ok
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = current_user.reviews.build
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = current_user.reviews.build(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_back(fallback_location: root_path, alert: 'Please provide a valid review [1 -180 characters] !') }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
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
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:content,:user_id)
    end
end
