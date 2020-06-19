class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    # @users = current_user.tob_followed.take(3)
    @user = User.find(params[:id])
    @followers = @user.followers_list.take(3)
    @review = Review.new
    @reviews = Review.includes(:user).where(user: @user).ordered_by_most_recent
  end

  def follow_user
    user_to_follow = User.find(params[:user_id])

    following = Following.new(followed_id: user_to_follow.id, follower_id: current_user.id)
    if following.save
      redirect_back(fallback_location: root_path,
                    notice: "You are following @#{user_to_follow.username}")
    else
      redirect_back(fallback_location: root_path,
                    alert: 'Oops! something went wrong!')
    end
  end
end

# # GET /reviews/1
# # GET /reviews/1.json
# def show
# end

# # GET /reviews/new
# def new
#   @review = current_user.reviews.build
# end
