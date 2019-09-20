class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user


  def index
    @carted_products = current_user.cart
    render 'index.json.jb'
  end

  def create
    @carted_product = CartedProduct.new(
                                          user_id: current_user.id,
                                          product_id: params[:product_id],
                                          quantity: params[:quantity],
                                          status: "Carted"
                                          )
    if @carted_product.save
      render 'show.json.jb'
    end
            
  end


  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status:"removed")

    render json: {message: "successfully destroyed carted product"}
    
  end
end
