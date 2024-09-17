class MypagesController < ApplicationController
  def show
  end

  def favorite
    @favorites = Favorite.where(user_id: current_user.id)
  end
end
