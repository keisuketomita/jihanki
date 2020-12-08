# ruby submit.rb
require './vending_machine'

vm = VendingMachine.new
vm.slot_money(1000)
coke = Drink.new(:coke, 120, 5)
red_bull = Drink.new(:RedBull, 200, 5)
water = Drink.new(:water, 100, 5)
vm.stocks(coke, red_bull, water)
puts "***"
vm.purchase(coke)
vm.confirm_sale_amount
vm.available_to_purchase
puts "***"
vm.purchase(red_bull)
vm.confirm_sale_amount
vm.available_to_purchase
puts "***"
vm.purchase(water)
vm.confirm_sale_amount
vm.available_to_purchase
puts "***"
vm.purchase(red_bull)
vm.confirm_sale_amount
vm.available_to_purchase
puts "***"
vm.purchase(red_bull)
vm.confirm_sale_amount
vm.available_to_purchase
puts "***"
vm.purchase(red_bull)
vm.confirm_sale_amount
vm.available_to_purchase
puts "***"
vm.purchase(coke)
vm.confirm_sale_amount
vm.available_to_purchase
puts "***"
vm.purchase(water)
vm.confirm_sale_amount
vm.available_to_purchase
puts "***"
