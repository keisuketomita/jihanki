# ruby submit.rb
require './vending_machine'

# インスタンスを生成
vm = VendingMachine.new
# 投入金額は0円(initializeメソッド実行されたため)
vm.current_slot_money
# 100円投入→反映される
vm.slot_money(100) # 100
# 200円投入→反映されない
vm.slot_money(200) # 100
# 500円投入→反映される
vm.slot_money(500) # 600
# 50円投入→反映される
vm.slot_money(50) # 650
# 10円投入→反映される
vm.slot_money(10) # 660
# 1000円投入→反映される
vm.slot_money(1000) # 1660
# 5000円投入→反映されない
vm.slot_money(5000) # 1660
vm.return_money # 1660


# インスタンスを生成
dr = Drink.new
dr.display
