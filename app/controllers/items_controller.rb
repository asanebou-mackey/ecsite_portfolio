class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "登録に成功しました"
      redirect_to items_path
    else
      flash.now[:notice] = "登録に失敗しました" 
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if Item.update(item_params)
      flash[:notice] = "登録に成功しました"
      redirect_to items_path
    else
      flash.now[:notice] = "登録に失敗しました"
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to items_path, notice: "削除に成功しました"
    else
      flash.now[:danger] = "削除に失敗しました"
      render :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :size, :color, :gender, :image, :brand_id, :category_id)
  end
end
