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
    @order.save!

    @cart.each do |cart|
      cart.destroy
    end
    
    flash[:notice] = "注文完了"
    redirect_to orders_path
  end

  def order_params(total_amount)
    params.require(:order).permit(:total_amount, :user_id).merge(total_amount: total_amount, user_id: current_user.id)
  end
end
