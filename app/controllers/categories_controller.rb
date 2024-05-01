class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "登録に成功しました"
      redirect_to categories_path
    else
      flash.now[:notice] = "登録に失敗しました" 
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: "編集に成功しました"
    else
      flash.now[:notice] = "編集に失敗しました"
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_path, notice: "削除に成功しました"
    else
      flash.now[:danger] = "削除に失敗しました"
      render :index
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
