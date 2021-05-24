class Product < ApplicationRecord
    belongs_to :user

    has_many :order_items
    has_many :cart_items, dependent: :destroy
    has_one_attached :cover

    validates :name, :condition, :console, presence: true
    validates :price, numericality: { greater_than: 0 }
end
