require 'faker'

# --- Products ---
puts "Creating products..."
50.times do
  Product.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price: Faker::Commerce.price(range: 5.0..200.0, as_string: false),
    stock: rand(5..50)
  )
end

# --- Carts & Line Items ---
puts "Creating carts with line items..."
12.times do
  cart = Cart.create!
  Product.order("RANDOM()").limit(rand(2..4)).each do |product|
    cart.line_items.create!(
      product: product,
      quantity: rand(1..3)
    )
  end
end

# --- Orders & Order Items ---
puts "Creating orders..."
20.times do
  order = Order.create!(
    status: ['pending', 'paid', 'cancelled'].sample,
    total: 0
  )
  Product.order("RANDOM()").limit(rand(2..4)).each do |product|
    order.order_items.create!(
      product: product,
      quantity: rand(1..3),
      price: product.price
    )
  end
  order.calculate_total!
end

puts "✅ Seeding complete!"
