class CartsController < ApplicationController
  before_action :set_cart

  def show
  end

  def add_item
    @cart.add_product(params[:product_id], params[:quantity].to_i.presence || 1)
    redirect_to cart_path, notice: "Added to cart"
  end

  def remove_item
    li = @cart.line_items.find(params[:id])
    li.destroy
    redirect_to cart_path
  end

  private

  def set_cart
    @cart = current_cart
  end

  def current_cart
    if session[:cart_id]
      Cart.find_by(id: session[:cart_id]) || create_cart
    else
      create_cart
    end
  end

  def create_cart
    cart = Cart.create!
    session[:cart_id] = cart.id
    cart
  end
end
