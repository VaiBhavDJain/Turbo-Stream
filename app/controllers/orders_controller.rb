class OrdersController < ApplicationController
  before_action :set_cart

  def new
    @order = Order.new
    redirect_to root_path, alert: "Cart empty" if @cart.line_items.empty?
  end

  def create
    @order = Order.create(status: 'pending', total: 0)
    @cart.line_items.each do |li|
      @order.order_items.create(product: li.product, quantity: li.quantity, price: li.product.price)
    end
    @order.calculate_total!
    session.delete(:cart_id)
    redirect_to order_path(@order), notice: "Order placed!"
  end

  def show
    @order = Order.find(params[:id])
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
