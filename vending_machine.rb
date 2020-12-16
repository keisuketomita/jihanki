# irb → require './vending_machine'
class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].map(&:freeze).freeze
  def initialize
    @slot_money = 0
    @stocks = []
  end
  def current_slot_money
    puts "現在#{@slot_money}円が投入されています"
  end
  def slot_money(money)
    puts "#{money}円は存在しない硬貨または紙幣です" unless MONEY.include?(money)
    return false unless MONEY.include?(money)
    @slot_money += money
    self.current_slot_money
  end
  def return_money
    puts "#{@slot_money}円を返却します"
    @slot_money = 0
  end
  def purchase(drink)
    if drink.price <= @slot_money && drink.stock > 0
      drink.stock -= 1
      @slot_money -= drink.price
      puts "#{drink.name}を購入しました"
      self.return_money
      return drink.price
    else
      puts "投入金額不足のため#{drink.name}を購入できませんでした"
      return 0
    end
  end
  def stocks(coke, red_bull, water)
    @stocks = [coke, red_bull, water]
  end
  def available_to_purchase
    puts "購入可能な商品"
    @stocks.each do |stock|
      puts "・#{stock.name}：残り#{stock.stock}個" if stock.price <= @slot_money && stock.stock > 0
    end
  end
end

class Drink
  attr_reader :name, :price
  attr_accessor :stock
  # ドリンクを事前に規定しておくと勝手にドリンクが作られにくい(規定してあるドリンクを作ろうという動機づけになる？)
  class << self
    def set_drink_coke
      # self.new
      self.new(:coke, 120, 5)
    end
    def set_drink_redbull
      self.new(:RedBull, 200, 10)
    end
    def set_drink_water
      self.new(:water, 100, 20)
    end
  end
  # コーラ初期値でもうまくいく
  # def initialize(name = :coke, price = 120, stock = 5)
  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end
end

class Money
  attr_accessor :sales
  def initialize
    @sales = 0
  end
  def sales(sale)
    @sales += sale
    puts "#{@sales}円の売上があります"
  end
end
