class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal
    self.subtotal = user.cart.sum { |carted_product| carted_product.subtotal }
  end

  def calculate_tax
    self.tax = subtotal * 0.09
    
  end

  def calculate_total
    self.total = subtotal + tax
  end

  def complete_purchase
    calculate_subtotal
    calculate_tax
    calculate_total
    save
    
    user.cart.update(order_id: @order.id, status: "Purchased")
  end
end
