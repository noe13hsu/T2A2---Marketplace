class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :products, through: :order_items

  def total_amount
    total_amount = 0
    order_items.each do |item|
      total_amount += item.product.price.to_f
    end
    return total_amount
  end
end