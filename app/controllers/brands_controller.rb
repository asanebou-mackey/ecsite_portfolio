class BrandsController < ApplicationController
  def index
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:notice] = "登録に成功しました"
      redirect_to brands_index_path
    else
      flash.now[:notice] = "登録に失敗しました" 
      render :new
    end
  end

  private
  def brand_params
    params.require(:brand).permit(:name, :image)
  end
end
