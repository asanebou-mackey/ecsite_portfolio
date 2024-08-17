class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: %i[increase decrease destroy]

  def index
    @carts = current_user.carts
    @order = Order.new
  end

  def create
    increase_or_create(params[:cart][:item_id])
    redirect_to carts_path, notice: 'Successfully added product to your cart'
  end

  def increase
    @cart.increment!(:amount, 1)
    redirect_to request.referer, notice: 'Successfully updated your cart'
  end

  def decrease
    decrease_or_destroy(@cart)
    redirect_to request.referer, notice: 'Successfully updated your cart'
  end

  def destroy
    @cart.destroy
    redirect_to request.referer, notice: 'Successfully deleted one cart item'
  end

  def set_cart
    @cart = current_user.carts.find(params[:id])
  end

  def increase_or_create(item_id)
    cart = Cart.find_by(user_id: current_user.id, item_id: item_id)
    if cart
      cart.increment!(:amount, 1)
    else
      current_user.carts.build(item_id: item_id, amount: 1).save
    end
  end

  def decrease_or_destroy(cart)
    if cart.amount > 1
      cart.decrement!(:amount, 1)
    else
      cart.destroy
    end
  end
end
