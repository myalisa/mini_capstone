class Api::OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    if order.save
      render json: {message: "Order created successfully"}, status: :created
    else
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end 
  end
end
