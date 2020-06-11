class UsersController < ApplicationController

  def index
    @users = User.all
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
