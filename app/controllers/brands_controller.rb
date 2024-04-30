class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:notice] = "登録に成功しました"
      redirect_to brands_path
    else
      flash.now[:notice] = "登録に失敗しました" 
      render :new
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      redirect_to brands_path, notice: "編集に成功しました"
    else
      flash.now[:notice] = "編集に失敗しました"
      render :new
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    if @brand.destroy
      redirect_to brands_path, notice: "削除に成功しました"
    else
      flash.now[:danger] = "削除に失敗しました"
      render :index
    end
  end

  private
  def brand_params
    params.require(:brand).permit(:name, :image)
  end
end
