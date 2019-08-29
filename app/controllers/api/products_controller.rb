class Api::ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render 'product_view.json.jb'
  end
end
