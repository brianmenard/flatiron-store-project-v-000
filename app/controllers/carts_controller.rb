class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def checkout
    @cart.checkout
    current_user.current_cart = nil
    redirect_to cart_path(@cart), notice: "Thanks for your order!"
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_cart
    @cart = Cart.find_by(id: params[:id])
  end

end
