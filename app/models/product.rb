class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :product_categories
  has_many :products, through: :product_categories
  has_many :orders, through: :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true 
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }
  validates :description, presence: true
  

  
  def is_discounted?
    price < 2.00
  end

  def category_names
    self.categories.map {|category| category.name }
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end



end
