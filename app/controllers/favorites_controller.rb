class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    item = Micropost.find(params[:micropost_id])
    current_user.favorite(item)
    flash[:success] = '投稿をお気に入りにしました。'
    redirect_to root_url
  end

  def destroy
    item = Micropost.find(params[:micropost_id])
    current_user.unfavorite(item)
    flash[:success] = '投稿のお気に入りを解除しました。'
    redirect_to root_url
  end
end