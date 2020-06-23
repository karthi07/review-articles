class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: %i[articles_data add_review]
  before_action :add_review_params, only: [:add_review]

  # GET /reviews
  # GET /reviews.json
  def index
    @review = Review.new
    @reviews = Review.where(user: current_user.following_list + [current_user]).includes([:user]).ordered_by_most_recent
    @users = current_user.tob_followed.take(3)
  end

  # get review from react and insert into db
  def add_review
    @review = current_user.reviews.build(content: params[:review],
                                         article_title: params[:title], article_link: params[:link])
    if @review.save
      render json: [], status: :ok
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # Location where react is loaded
  #
  # rubocop:disable  Naming/AccessorMethodName
  def get_articles
    @users = current_user.tob_followed.take(3)
    render 'articles'
  end
  # rubocop:enable  Naming/AccessorMethodName

  # API that server data to react
  def articles_data
    redis = Redis.new(host: 'localhost', port: 6379, db: 0)
    articles_json = redis.get('articles')
    render json: articles_json, status: :ok
  end

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to root_path, notice: 'Review was successfully created.' }
      else
        format.html do
          redirect_back(fallback_location: root_path,
                        alert: 'Please provide a valid review [1 -180 characters] !')
        end
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:content, :user_id)
  end
  def add_review_params
    params.permit(:review, :title, :link)
  end
end
