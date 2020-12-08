# irb → require './vending_machine'
class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
    @sale_amount = 0
    @stocks = []
  end
  def current_slot_money
    puts "現在#{@slot_money}円が投入されています"
  end
  def slot_money(money)
    puts "#{money}円は存在しない硬貨または紙幣です" unless MONEY.include?(money)
    return false unless MONEY.include?(money)
    @slot_money += money
    current_slot_money
  end
  def return_money
    puts "#{@slot_money}円を返却します"
    @slot_money = 0
    current_slot_money
  end
  def purchase(drink)
    if drink.price < @slot_money && drink.stock > 0
      drink.stock -= 1
      @slot_money -= drink.price
      @sale_amount += drink.price
      puts "#{drink.name}を購入しました"
    # else
    #   puts "購入できませんでした"
    end
    current_slot_money
  end
  def confirm_sale_amount
    puts "#{@sale_amount}円の売上があります"
  end
  def stocks(coke, red_bull, water)
    @stocks = [coke, red_bull, water]
  end
  def available_to_purchase
    puts "購入可能な商品"
    @stocks.each do |stock|
      puts "・#{stock.name}：残り#{stock.stock}個" if stock.price < @slot_money && stock.stock > 0
    end
  end
end

class Drink
  attr_accessor :name, :price, :stock
  # @coke = self.new(:coke, 120, 5)
  # @red_bull = self.new(:RedBull, 200, 5)
  # @water = self.new(:water, 100, 5)
  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end
end
