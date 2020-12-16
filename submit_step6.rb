# ruby submit.rb
require './vending_machine'

vm = VendingMachine.new
mn = Money.new
coke = Drink.set_drink_coke
red_bull = Drink.set_drink_redbull
water = Drink.set_drink_water
vm.stocks(coke, red_bull, water)

vm.slot_money(100)
vm.available_to_purchase
buy_water = vm.purchase(water)
mn.sales(buy_water)

vm.slot_money(100)
vm.slot_money(50)
vm.available_to_purchase
buy_coke = vm.purchase(coke)
mn.sales(buy_coke)

vm.slot_money(100)
vm.slot_money(100)
vm.available_to_purchase
buy_redbull = vm.purchase(red_bull)
mn.sales(buy_redbull)
