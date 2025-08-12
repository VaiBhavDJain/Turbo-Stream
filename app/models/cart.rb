class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product_id, qty = 1)
    item = line_items.find_by(product_id: product_id)
    if item
      item.increment(:quantity, qty)
      item.save
    else
      line_items.create(product_id: product_id, quantity: qty)
    end
  end

  def total
    line_items.includes(:product).sum { |li| li.product.price * li.quantity }
  end
end
