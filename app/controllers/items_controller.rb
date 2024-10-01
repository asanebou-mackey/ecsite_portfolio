class ItemsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    if params[:latest]
      @items = Item.latest
    elsif params[:old]
      @items = Item.old
    elsif params[:most_favorited]
      @items = Item.most_favorited
    elsif params[:expensive]
      @items = Item.expensive
    elsif params[:cheap]
      @items = Item.cheap
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
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
    if @item.update(item_params)
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

  def search
    @results = @q.result
  end

  def set_q
    @q = Item.ransack(params[:q])
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :size, :color, :gender, :image, :brand_id, :category_id)
  end
end
