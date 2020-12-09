# ruby submit.rb
require './vending_machine'

puts "***お釣りあり***"
vm = VendingMachine.new
vm.slot_money(500)
coke = Drink.new(:coke, 120, 5)
red_bull = Drink.new(:RedBull, 200, 5)
water = Drink.new(:water, 100, 5)
vm.stocks(coke, red_bull, water)
vm.available_to_purchase
vm.purchase(water)
vm.confirm_sale_amount
puts "***お釣りなし***"
vm = VendingMachine.new
vm.slot_money(100)
vm.slot_money(10)
vm.slot_money(10)
coke = Drink.new(:coke, 120, 5)
red_bull = Drink.new(:RedBull, 200, 5)
water = Drink.new(:water, 100, 5)
vm.stocks(coke, red_bull, water)
vm.available_to_purchase
vm.purchase(coke)
vm.confirm_sale_amount
puts "***残高不足で購入できない***"
vm = VendingMachine.new
vm.slot_money(100)
coke = Drink.new(:coke, 120, 5)
red_bull = Drink.new(:RedBull, 200, 5)
water = Drink.new(:water, 100, 5)
vm.stocks(coke, red_bull, water)
vm.available_to_purchase
vm.purchase(red_bull)
vm.confirm_sale_amount
