class FavoritesController < ApplicationController 
  def create
    user = User.find(params[:user_id])
    favorite = current_user.favorites.new(user_id: user.id)
    favorite.save
    redirect_to user_path(user)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
end
