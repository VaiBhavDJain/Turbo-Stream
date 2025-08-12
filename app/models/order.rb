class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  enum :status, { pending: 0, paid: 1, cancelled: 2 }

  def calculate_total!
    update(total: order_items.sum { |oi| oi.price * oi.quantity })
  end
end
