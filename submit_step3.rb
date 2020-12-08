# ruby submit.rb
require './vending_machine'

# インスタンスを生成
vm = VendingMachine.new
# 1000円投入→反映される
vm.slot_money(1000) # 1000
drink = Drink.new
puts "***"
vm.purchase(drink)
vm.comfirm_sales
puts "***"
vm.purchase(drink)
vm.comfirm_sales
puts "***"
vm.purchase(drink)
vm.comfirm_sales
puts "***"
vm.purchase(drink)
vm.comfirm_sales
puts "***"
vm.purchase(drink)
vm.comfirm_sales
puts "***"
vm.purchase(drink)
vm.comfirm_sales
puts "***"
