class OrdersController < ApplicationController
  def index
  end

  def create
    @cart = Cart.where(user_id: current_user.id)
    @total_amount = 0

    @cart.each do |cart|
      @total_amount += cart.item.price * cart.amount
    end

    @order = Order.new(order_params(@total_amount))
    if @order.save
    else
      flash.now[:notice] = "注文できませんでした" 
      render "carts/index"
    end

    @cart.each do |cart|
      @quantity = cart.amount
      @price = cart.item.price * cart.amount
      @order_detail = OrderDetail.new(price: @price, quantity: @quantity, order_id: @order.id, item_id: cart.item_id)
      @order_detail.save!
      @order_detail.save
    end

    @cart.each do |cart|
      cart.destroy
    end

    flash[:notice] = "注文が完了しました"
    redirect_to orders_path
  end

  def mypage
    @orders = Order.where(user_id: current_user.id).order(id: "DESC")
  end

  def order_params(total_amount)
    params.require(:order).permit(:total_amount, :user_id).merge(total_amount: total_amount, user_id: current_user.id)
  end
end
