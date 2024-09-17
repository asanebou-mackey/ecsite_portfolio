class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.build(favorite_params)
    @item = @favorite.item
    if @favorite.save
      redirect_to item_path(@item)
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @item = @favorite.item
    if @favorite.destroy
      redirect_to item_path(@item)
    end
  end

  def favorite_params
    params.permit(:item_id)
  end
end
