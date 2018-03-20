class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :asc)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def update_twitter_settings
    user = User.find(params[:user_id])
    user.update(twitter_id: params[:twitter_id], twitter_token: params[:twitter_token])
    head: :ok
  end

  def twitter_timeline
    render json: { timeline: Twitter.new(User.find(params[:id])).timeline }
  end

  private

  def user_params
    params.require(:user)
          .permit(:github_repository, :city)
  end
end
