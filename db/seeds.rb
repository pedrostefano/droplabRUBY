

10.times do |item|
  Item.create!(name: SecureRandom.hex(12), quantity: SecureRandom.hex(12), price: SecureRandom.hex(12) )
end
puts "10 items created"
