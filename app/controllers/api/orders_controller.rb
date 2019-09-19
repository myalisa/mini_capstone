class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]

  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def create
    # carted_products.where (current_user: id, status: carted)        How you write this???
    # subtotal = Product.find_by(id: ).price 
    @order = Order.new(
                      user_id: current_user.id,
                      subtotal:
                      
                      )
    if @order.save
      render 'show.json.jb'
    else
      render json: {errors: order.errors.full_messages}, status: :unprocessible_entity
    end 
  end

  def show
    @order = Order.find(params[:id])
    render 'show.json.jb'
  end
end
